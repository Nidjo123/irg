#include <iostream>
#include <sstream>
#include <stdexcept>
#include <cmath>
#include <boost/algorithm/string.hpp>
#include <GL/glut.h>
#include <GL/freeglut.h>
#include "ObjectModel.h"
#include <IRG.hpp>
#include <Vector.hpp>
#include <Matrix.hpp>

const int WIDTH = 640;
const int HEIGHT = 480;

double angle = atan(1.0/3.0);
double increment = 1.0;
double r = 1.0 / sin(angle);

int hidingMode = 1;

void reshape(int width, int height);
void display();
void renderScene();
void keyPressed(unsigned char key, int x, int y);
void animate(int);

ObjectModel model;

int main(int argc, char *argv[]) {
  // učitavanje modela
  std::string file;
  if (argc != 2) {
    std::cout << "Upisite put do .obj datoteke: ";
    std::cin >> file;
  } else {
    file = argv[1];
  }

  std::cout << "Reading file " << file << std::endl;

  try {
    model = ObjectModel(file);
  } catch(const std::exception& e) {
    std::cout << e.what() << std::endl;
    return 1;
  }

  bool done = false;
  std::string input;
  
  while (!done) {
    std::getline(std::cin, input);
    boost::trim(input);

    if (boost::iequals(input, "render")) {
      model.normalize();

      std::cout << "Jednadzbe povrsina:\n";
      for (auto &face : model.getFaces()) {
	const glm::vec4 s = face.surface;
	std::cout << s.x << "x + " << s.y << "y + " << s.z << "z + " << s.w << " = 0" << std::endl;
      }
      // glut
      glutInit(&argc, argv);
      glutInitDisplayMode(GLUT_DOUBLE);
      glutInitWindowSize(WIDTH, HEIGHT);
      glutInitWindowPosition(0, 0);
      glutCreateWindow("Skrivanje nevidljivih povrsina 2");
      glutDisplayFunc(display);
      glutReshapeFunc(reshape);
      glutKeyboardFunc(keyPressed);

      glutTimerFunc(1000.0/60, animate, 0);

      glutMainLoop();
    } else if (boost::iequals(input, "quit")) {
      done = true;
    } else if (boost::iequals(input, "normiraj")) {
      model.normalize();
      std::cout << model.dumpToOBJ() << std::endl;
    } else if (boost::iequals(input, "print")) {
      std::cout << model.dumpToOBJ() << std::endl;
    } else {
      // 3D point
      std::istringstream iss(input);
      float x, y, z;
      
      iss >> x >> y >> z;

      int pointPos = model.testPoint(x, y, z);
      
      std::cout << "Tocka (" << x << ", " << y << ", " << z << ") ";
      if (pointPos < 0) {
	std::cout << "je unutar objekta." << std::endl;
      } else if (pointPos > 0) {
	std::cout << "nije unutar objekta." << std::endl;
      } else {
	std::cout << "je na obodu objekta." << std::endl;
      }
    }
  }
  
  return 0;
}

void animate(int) {
  angle += 0.01;
  glutPostRedisplay();
  glutTimerFunc(1000.0/60, animate, 0);
}

void display() {
  glClearColor(1.0f, 1.0f, 1.0f, 1.0f);
  glClear(GL_COLOR_BUFFER_BIT);
  glLoadIdentity();
  
  renderScene();

  glutSwapBuffers();
}

void reshape(int width, int height) {
  glDisable(GL_DEPTH_TEST);
  
  glViewport(0, 0, (GLsizei)width, (GLsizei)height);

  glMatrixMode(GL_PROJECTION);
  glLoadIdentity();
  
  glMatrixMode(GL_MODELVIEW);
}

void renderScene() {
  const std::vector<Vertex3D>& vertices = model.getVertices();
  std::vector<Face3D>& faces = model.getFaces();

  glColor3f(0.0f, 0.0f, 0.0f);

  IVectorPtr eye = IVectorPtr(new Vector(r*cos(angle), 4.0, r*sin(angle)));
  
  IMatrixPtr lookAt = IRG::lookAtMatrix2(eye,
					 IVectorPtr(new Vector(0, 0, 0)),
					 IVectorPtr(new Vector(0, 1, 0)));

  IMatrixPtr perspective = IRG::buildFrustumMatrix(-0.5, 0.5, -0.5, 0.5, 1.0, 100.0);

  IMatrixPtr m = lookAt->nMultiply(perspective);

  for (auto &face : faces) {
    face.visible = true;
  }

  if (hidingMode == 2) {
    model.determineFaceVisibilities1(eye);
  } else if (hidingMode == 3) {
    model.determineFaceVisibilities2(eye);
  }
  
  for (Face3D face : faces) {
    if (!face.visible) continue;
    IVectorPtr verts[3];
    
    for (int i = 0; i < 3; i++) {
      const Vertex3D& vert = vertices[face[i]];
      IVectorPtr p = IVectorPtr(new Vector(vert.x, vert.y, vert.z, 1.0));
      verts[i] = p->toRowMatrix(false)->nMultiply(m)->toVector(false)->nFromHomogeneous();
    }

    if (hidingMode == 4 && !IRG::isCCW(verts[0], verts[1], verts[2])) continue;
    
    glBegin(GL_LINE_LOOP);
    for (int i = 0; i < 3; i++) {
      glVertex2f(verts[i]->get(0), verts[i]->get(1));
    }
    glEnd();
  }
  
}

void keyPressed(unsigned char key, int x, int y) {
  if (key == 'r') {
    angle += increment;
  } else if (key == 'l') {
    angle -= increment;
  } else if (key == 27) {
    angle = atan(1.0/3.0);
    increment = 1.0;
    r = 1.0 / sin(angle);
  } else if (key == '1') {
    hidingMode = 1;
    std::cout << "Bez odbacivanja" << std::endl;
  } else if (key == '2') {
    hidingMode = 2;
    std::cout << "Odbacivanje algoritmom 1" << std::endl;
  } else if (key == '3') {
    hidingMode = 3;
    std::cout << "Odbacivanje algoritmom 2" << std::endl;
  } else if (key == '4') {
    hidingMode = 4;
    std::cout << "Odbacivanje algoritmom 3" << std::endl;
  }

  glutPostRedisplay();
}
