#include <iostream>
#include <GL/glut.h>
#include <GL/freeglut.h>
#include <Vector.hpp>
#include <IRG.hpp>
#include "RTScene.hpp"

int WIDTH = 1024;
int HEIGHT = 768;

void reshape(int width, int height);
void display();
void renderScene();
void closeFunc();
//void keyPressed(unsigned char key, int x, int y);

RTScene *scene;

int main(int argc, char *argv[]) {
  // učitavanje modela
  std::string file;
  if (argc != 2) {
    std::cout << "Upisite put do datoteke opisa scene: ";
    std::cin >> file;
  } else {
    file = argv[1];
  }

  std::cout << "Reading file " << file << std::endl;
  scene = RTScene::readScene(file);

  scene->printInfo();

  glutInit(&argc, argv);
  glutInitDisplayMode(GLUT_DOUBLE);
  glutInitWindowSize(WIDTH, HEIGHT);
  glutInitWindowPosition(0, 0);
  glutCreateWindow("Raytracer");
  glutDisplayFunc(display);
  glutReshapeFunc(reshape);
  glutCloseFunc(closeFunc);
  //  glutKeyboardFunc(keyPressed);

  glutMainLoop();
  
  return 0;
}

void display() {
  glClearColor(0.0f, 0.0f, 0.0f, 0.0f);
  glClear(GL_COLOR_BUFFER_BIT);
  glLoadIdentity();
  
  renderScene();

  glutSwapBuffers();
}

void reshape(int width, int height) {
  WIDTH = width;
  HEIGHT = height;
  
  glDisable(GL_DEPTH_TEST);
  glViewport(0, 0, (GLsizei)width, (GLsizei)height);
  glMatrixMode(GL_PROJECTION);
  glLoadIdentity();

  glOrtho(0, width-1, 0, height-1, -1, 1);
  
  glMatrixMode(GL_MODELVIEW);
}

void closeFunc() {
  delete scene;
}

RGBColor trace(IVectorPtr, IVectorPtr, int);

RGBColor color(SceneObject *object, IVectorPtr start, IVectorPtr d, double lambda, Intersection inters, int depth) {
  static const double EPS = 1e-4;
  if (depth <= 0) return scene->gaIntensity;

  IVectorPtr normal = inters.object->getNormalInPoint(inters.point);
  IVectorPtr pointEye = scene->eye->nSub(inters.point);

  if (!inters.front) {
    // važno ako zraka dođe sa stražnje strane
    normal->negate();
  }

  // global ambient
  RGBColor col = scene->gaIntensity;

  if (inters.front) {
    col *= inters.object->fambRGB;
  } else {
    col *= inters.object->bambRGB;
  }
  
  for (auto light : scene->lights) {
    IVectorPtr lDir = light->position->nSub(inters.point);
    const double distLight = lDir->norm();
    lDir->normalize();

    Intersection inters2;

    IVectorPtr startP = inters.point->nAdd(lDir->nScalarMultiply(EPS));

    for (auto object : scene->objects) {
      object->updateIntersection(inters2, startP, lDir);
    }

    if (inters2.object != nullptr) {
      double distInters = inters2.point->nSub(inters.point)->norm();
      if (distInters < distLight) continue;
    }

    double diffK = std::max(lDir->cosine(normal), 0.0);

    RGBColor diffuse = light->rgb * diffK;

    if (inters.front) {
      diffuse *= inters.object->fdifRGB;
    } else {
      diffuse *= inters.object->bdifRGB;
    }
    
    col += diffuse;
    
    // reflected
    RGBColor reflect = light->rgb;
    
    IVectorPtr reflected = IRG::reflect(lDir->nNegate(), normal)->normalize();
    double kRef;
    double cosa = std::max(pointEye->cosine(reflected), 0.0);

    if (inters.front) {
      kRef = pow(cosa, inters.object->fn);      
      reflect *= inters.object->frefRGB * kRef;
    } else {
      kRef = pow(cosa, inters.object->bn); 
      reflect *= inters.object->brefRGB * kRef;
    }

    col += reflect;
  }
  
  // add reflected

  IVectorPtr reflectedRay = IRG::reflect(d, normal);
  const double kRef = (inters.front ? inters.object->fkref : inters.object->bkref);
  
  col += trace(inters.point->nAdd(reflectedRay->nScalarMultiply(EPS)), reflectedRay, depth - 1) * kRef;

  if (col.r > 1) col.r = 1.0;
  if (col.g > 1) col.g = 1.0;
  if (col.b > 1) col.b = 1.0;

  if (col.r < 0) col.r = 0;
  if (col.g < 0) col.g = 0;
  if (col.b < 0) col.b = 0;
  
  return col;
}

RGBColor trace(IVectorPtr start, IVectorPtr d, int depth) {
  if (depth <= 0) return RGBColor(0, 0, 0);
  
  Intersection inters;
  
  for (auto object : scene->objects) {
    object->updateIntersection(inters, start, d);
  }

  bool foundIntersection = (inters.object != nullptr);

  if (foundIntersection) {
    //std::cout << "Found intersection! " << inters.lambda << std::endl;
    return color(inters.object, start, d, inters.lambda, inters, depth);
  } else {
    // pozadinska boja
    return RGBColor(0, 0, 0);
  }
}

void renderScene() {
  const int EPS = 1e-6;

  for (int x = 0; x < WIDTH; x++) {
    for (int y = 0; y < HEIGHT; y++) {
      IVectorPtr start = scene->startPoint(x, y, WIDTH, HEIGHT);
      IVectorPtr d = start->nSub(scene->eye)->normalize();
      start->add(d->nScalarMultiply(EPS));
      
      RGBColor col = trace(start, d, 5);

      glColor3f(col.r, col.g, col.b);
      
      glBegin(GL_POINTS);
      glVertex2f(x, y);
      glEnd();
    }
  }
}
