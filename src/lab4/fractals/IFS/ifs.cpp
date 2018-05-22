#include <iostream>
#include <fstream>
#include <vector>
#include <string>
#include <cmath>
#include <cstdlib>
#include <boost/algorithm/string.hpp>
#include <GL/glut.h>
#include <GL/freeglut.h>

int WIDTH = 600;
int HEIGHT = 600;

struct Transform {
  double a, b, c, d, e, f, p;
};

void reshape(int width, int height);
void display();
void renderScene();
//void keyPressed(unsigned char key, int x, int y);
//void mouseFunc(int button, int state, int x, int y);

int pointsNumber;
int limit;
double eta1, eta2;
double eta3, eta4;
std::vector<Transform> transforms;

void readFile(char *path);

int main(int argc, char *argv[]) {
  if (argc != 2) {
    std::cout << "Navedite put do datoteke s opisom IFS fraktala." << std::endl;
    return 1;
  }

  readFile(argv[1]);
  
  glutInit(&argc, argv);
  glutInitDisplayMode(GLUT_DOUBLE);
  glutInitWindowSize(WIDTH, HEIGHT);
  glutInitWindowPosition(0, 0);
  glutCreateWindow("IFS");
  glutDisplayFunc(display);
  glutReshapeFunc(reshape);
  //glutKeyboardFunc(keyPressed);
  //glutMouseFunc(mouseFunc);

  glutMainLoop();
  
  return 0;
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

void readFile(char *path) {
  std::ifstream ifs(path);
  
  std::string line = nextLine(ifs);
  std::vector<std::string> tokens;

  pointsNumber = std::stod(line);
  
  line = nextLine(ifs);

  limit = std::stoi(line);

  line = nextLine(ifs);
  boost::split(tokens, line, boost::is_any_of(" \t"), boost::token_compress_on);

  eta1 = std::stod(tokens[0]);
  eta2 = std::stod(tokens[1]);

  tokens.clear();
  line = nextLine(ifs);
  boost::split(tokens, line, boost::is_any_of(" \t"), boost::token_compress_on);

  eta3 = std::stod(tokens[0]);
  eta4 = std::stod(tokens[1]);
  
  while (ifs) {
    tokens.clear();
    line = nextLine(ifs);

    if (line.empty()) continue;

    Transform t;
    
    boost::split(tokens, line, boost::is_any_of(" \t"), boost::token_compress_on);

    t.a = std::stod(tokens[0]);
    t.b = std::stod(tokens[1]);
    t.c = std::stod(tokens[2]);
    t.d = std::stod(tokens[3]);
    t.e = std::stod(tokens[4]);
    t.f = std::stod(tokens[5]);
    t.p = std::stod(tokens[6]);

    transforms.push_back(t);
  }
}

void display() {
  glClearColor(1.0f, 1.0f, 1.0f, 1.0f);
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

void renderScene() {
  glPointSize(1);
  glColor3f(0.f, 0.3f, 0.1f);
  glBegin(GL_POINTS);

  for (int br = 0; br < pointsNumber; br++) {
    double x0 = 0;
    double y0 = 0;

    for (int i = 0; i < limit; i++) {
      double x, y;
      double acc = 0.0;
      double p = (rand() % 100) / 100.0;

      for (auto t : transforms) {;
	if (p >= acc && p < acc + t.p) {
	  // choose this
	  x = t.a*x0 + t.b*y0 + t.e;
	  y = t.c*x0 + t.d*y0 + t.f;
	}
	acc += t.p;
      }

      x0 = x;
      y0 = y;
    }

    glVertex2f(std::round(x0*eta1+eta2), std::round(y0*eta3+eta4));
  }
  
  glEnd();
}
