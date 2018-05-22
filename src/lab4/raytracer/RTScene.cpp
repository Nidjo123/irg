#include "RTScene.hpp"
#include <fstream>
#include <iostream>
#include <cstring>
#include <cmath>
#include <boost/algorithm/string.hpp>
#include <Vector.hpp>

RTScene::~RTScene() {
  std::cout << "Cleaning up!" << std::endl;
  
  // cleanup
  for (auto light : lights) {
    delete light;
  }

  for (auto object : objects) {
    delete object;
  }
}

std::string nextLine(std::ifstream &ifs) {
  std::string s;
  std::getline(ifs, s);

  // remove comment
  std::vector<std::string> tokens;
  boost::split(tokens, s, boost::is_any_of("#"));
  boost::trim(tokens[0]);

  return tokens[0];
}

void setVector(IVectorPtr *vec, std::vector<std::string> &tokens, int index = 1) {
  *vec = IVectorPtr(new Vector(3));
  (*vec)->set(0, std::stod(tokens[index + 0]));
  (*vec)->set(1, std::stod(tokens[index + 1]));
  (*vec)->set(2, std::stod(tokens[index + 2]));
}

void setRGB(RGBColor *col, std::vector<std::string> &tokens, int index = 1) {
  col->r = std::stod(tokens[index + 0]);
  col->g = std::stod(tokens[index + 1]);
  col->b = std::stod(tokens[index + 2]);
}

RTScene* RTScene::readScene(std::string file) {
  RTScene *scene = new RTScene;
  
  std::ifstream ifs(file);

  if (!ifs) {
    std::cout << "Can't open file!" << std::endl;
  }

  while (ifs) {
    std::string line =  nextLine(ifs);

    std::vector<std::string> tokens;
    boost::split(tokens, line, boost::is_any_of(" \t"), boost::token_compress_on);

    std::string s = tokens[0];

    if (s.empty()) {
      continue;
    }
    
    if (boost::iequals(s, "e")) {
      // očište
      setVector(&scene->eye, tokens);
    } else if (boost::iequals(s, "v")) {
      // vektor pogleda (view)
      setVector(&scene->view, tokens);
    } else if (boost::iequals(s, "vu")) {
      // view up vektor
      setVector(&scene->viewUp, tokens);
    } else if (boost::iequals(s, "h")) {
      scene->h = std::stod(tokens[1]);
    } else if (boost::iequals(s, "xa")) {
      scene->xAngle = std::stod(tokens[1]);
    } else if (boost::iequals(s, "ya")) {
      scene->yAngle = std::stod(tokens[1]);
    } else if (boost::iequals(s, "ga")) {
      setRGB(&scene->gaIntensity, tokens);
    } else if (boost::iequals(s, "i")) {
      // izvor svjetlosti
      Light *light = new Light;

      light->position = IVectorPtr(new Vector(3));
      setVector(&light->position,  tokens);
      setRGB(&light->rgb, tokens, 4);

      scene->lights.push_back(light);
    } else if (boost::iequals(s, "o")) {
      // objekt (krpica ili sfera)
      if (boost::iequals(tokens[1], "s")) {
	// sfera/sphere
	Sphere *sphere = new Sphere;

	setVector(&sphere->center, tokens, 2);
	sphere->radius = std::stod(tokens[5]);
	setRGB(&sphere->fambRGB, tokens, 6);
	setRGB(&sphere->fdifRGB, tokens, 9);
	setRGB(&sphere->frefRGB, tokens, 12);
	sphere->fn = std::stod(tokens[15]);
	sphere->fkref = std::stod(tokens[16]);

	scene->objects.push_back(sphere);

	std::cout << "Read sphere, center: " << sphere->center->get(0) << ", " << sphere->center->get(1) << ", " << sphere->center->get(2) << ", radius: " << sphere->radius << std::endl;
      } else if (boost::iequals(tokens[1], "p")) {
	// krpica/patch
	Patch *patch = new Patch;

	setVector(&patch->center, tokens, 2);
	setVector(&patch->v1, tokens, 5);
	setVector(&patch->v2, tokens, 8);

	patch->normal = patch->v1->nVectorProduct(patch->v2)->normalize();
	
	patch->w = std::stod(tokens[11]);
	patch->h = std::stod(tokens[12]);

	// prednja strana
	setRGB(&patch->fambRGB, tokens, 13);
	setRGB(&patch->fdifRGB, tokens, 16);
	setRGB(&patch->frefRGB, tokens, 19);
	patch->fn = std::stod(tokens[22]);
	patch->fkref = std::stod(tokens[23]);

	std::cout << "fkref: " << patch->fkref << ", ";

	// stražnja strana
	setRGB(&patch->bambRGB, tokens, 24);
	setRGB(&patch->bdifRGB, tokens, 27);
	setRGB(&patch->brefRGB, tokens, 30);
	patch->bn = std::stod(tokens[33]);
	patch->bkref = std::stod(tokens[34]);

	std::cout << "bkref: " << patch->bkref << std::endl;
	
	scene->objects.push_back(patch);
      }
    } else {
      std::cout << "Unknown command: " << tokens[0] << std::endl;
    }
  }

  ifs.close();
  
  scene->computeKS();

  return scene;
}

void printVec3(IVectorPtr vec) {
  std::cout << "[" << vec->get(0) << ", " << vec->get(1) << ", " << vec->get(2) << "]" << std::endl;
}

void RTScene::printInfo() const {
  std::cout << "########## SCENE INFO ##########" << std::endl;
  std::cout << "Eye: ";
  printVec3(eye);
  std::cout << "G: ";
  printVec3(G);
  std::cout << "View: ";
  printVec3(view);
  std::cout << "ViewUp: ";
  printVec3(viewUp);
  std::cout << "xAxis: ";
  printVec3(xAxis);
  std::cout << "yAxis: ";
  printVec3(yAxis);
  std::cout << "h: " << h << "\nxAngle: " << xAngle << "\nyAngle: " << yAngle << std::endl;
  std::cout << "t: " << t << "\nb: " << b << "\nl: " << l << "\nr: " << r << std::endl;
  std::cout << "##############################" << std::endl;
}

IVectorPtr RTScene::startPoint(int x, int y, int w, int h_) const {
  // pretvori koordinate ekrana u koordinate točke u prostoru na ravnini projekcije
  return G->nAdd(xAxis->nScalarMultiply(-l+x/(double)w*(l+r)))->nAdd(yAxis->nScalarMultiply(-b+y/(double)h_*(t+b)));
}

inline double degToRad(double deg) {
  return deg * M_PI / 180.0;
}

void RTScene::computeKS() {
  // koordinate gledišta
  std::cout << "eye dodajem view koji mnozim s " << h << std::endl;
  G = eye->nAdd(view->normalize()->nScalarMultiply(h));
  // vektor očište->gledište
  IVectorPtr OG = G->nSub(eye);
  // y-os; projekcija viewUp vektora na ravninu projekcije
  yAxis = viewUp->nSub(view->nScalarMultiply(viewUp->scalarProduct(view)))->normalize();

  // x-os; vektorski product očište-gledište s y-osi
  xAxis = OG->nVectorProduct(yAxis)->normalize();

  // tan(yAngle/2) = t / h = b / h
  t = b = h * tan(degToRad(yAngle / 2));

  // tan(xAngle/2) = r / h = l / h
  l = r = h * tan(degToRad(xAngle / 2));
}
