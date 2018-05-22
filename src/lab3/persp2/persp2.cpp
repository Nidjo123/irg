#include <iostream>
#include <sstream>
#include <stdexcept>
#include <cmath>
#include <boost/algorithm/string.hpp>
#include <GL/glut.h>
#include <GL/freeglut.h>
#include "ObjectModel.h"

const int WIDTH = 640;
const int HEIGHT = 480;

double angle = atan(1.0/3.0);
double increment = 1.0;
double r = 1.0 / sin(angle);

void reshape(int width, int height);
void display();
void renderScene();
void keyPressed(unsigned char key, int x, int y);

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
      // glut
      glutInit(&argc, argv);
      glutInitDisplayMode(GLUT_DOUBLE);
      glutInitWindowSize(WIDTH, HEIGHT);
      glutInitWindowPosition(0, 0);
      glutCreateWindow("Perspektivna projekcija 1");
      glutDisplayFunc(display);
      glutReshapeFunc(reshape);
      glutKeyboardFunc(keyPressed);

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

void display() {
  glClearColor(0.0f, 1.0f, 0.0f, 1.0f);
  glClear(GL_COLOR_BUFFER_BIT);
  glLoadIdentity();

  //  std::cout <<  << " " << r << " " << r * cos(angle) << ", " << r * sin(angle) << std::endl;

  gluLookAt(r*cos(angle), 4.0, r*sin(angle),
	    0.0, 0.0, 0.0,
	    0.0, 1.0, 0.0);
  
  renderScene();

  glutSwapBuffers();
}

void reshape(int width, int height) {
  glDisable(GL_DEPTH_TEST);
  glViewport(0, 0, (GLsizei)width, (GLsizei)height);
  glMatrixMode(GL_PROJECTION);
  glLoadIdentity();

  const GLdouble h = 1.0;
  const GLdouble aspect = 1.0;
  const GLdouble near = 1.0;
  const GLdouble far = 100.0;
  const GLdouble fovy = 2 * atan(h / (2 * near)) * 180 / M_PI;

  std::cout << fovy << " " << aspect << " " << near << " " << far << std::endl;

  gluPerspective(fovy, aspect, near, far);
  
  glMatrixMode(GL_MODELVIEW);
}

void renderScene() {
  const std::vector<Vertex3D>& vertices = model.getVertices();
  const std::vector<Face3D>& faces = model.getFaces();

  glColor3f(1.0f, 0.0f, 0.0f);
  
  for (Face3D face : faces) {
    glBegin(GL_LINE_LOOP);
    for (int i = 0; i < 3; i++) {
      const Vertex3D& vert = vertices[face[i]];
      glVertex3f(vert.getX(), vert.getY(), vert.getZ());
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
  }

  glutPostRedisplay();
}
