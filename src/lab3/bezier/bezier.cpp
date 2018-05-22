#include <iostream>
#include <cmath>
#include <vector>
#include <GL/glut.h>
#include <GL/freeglut.h>
#include <Matrix.hpp>
#include <Vector.hpp>

const int WIDTH = 640;
const int HEIGHT = 480;

void reshape(int width, int height);
void display();
void renderScene();
void keyPressed(unsigned char key, int x, int y);
void mousePressedOrReleased(int button, int state, int x, int y);
void mouseDragged(int x, int y);

struct Point {
  static const int D = 5;
  int x;
  int y;

  Point() = default;
  
  Point(int x, int y) : x(x), y(y) {}

  void set(int x, int y) {
    this->x = x;
    this->y = y;
  }
  
  bool intersects(int px, int py) {
    const int dx = std::abs(x-px);
    const int dy = std::abs(y-py);

    return dx <= D && dy <= D;
  }
};

bool isDragging;
int dragIndex;
std::vector<Point> points;

int main(int argc, char *argv[]) {
  // glut
  glutInit(&argc, argv);
  glutInitDisplayMode(GLUT_DOUBLE);
  glutInitWindowSize(WIDTH, HEIGHT);
  glutInitWindowPosition(0, 0);
  glutCreateWindow("Bezierova krivulja");
  glutDisplayFunc(display);
  glutReshapeFunc(reshape);
  glutKeyboardFunc(keyPressed);
  glutMouseFunc(mousePressedOrReleased);
  glutMotionFunc(mouseDragged);

  glutMainLoop();
  
  return 0;
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

  glOrtho(0, width, height, 0, 0, 1); 
  
  glMatrixMode(GL_MODELVIEW);
}

int factorial(int n) {
  if (n <= 0) return 1;
  
  int res = 1;

  for (; n > 1; n--) {
    res *= n;
  }

  return res;
}

int choose(int n, int k) {
  if (n <= k) return 1;
  return factorial(n) / (factorial(k) * factorial(n-k));
}

double bernstein(int n, int i, double t) {
  return choose(n, i) * pow(t, i) * pow(1-t, n-i);
}

// http://www.idav.ucdavis.edu/education/CAGDNotes/Bernstein-Polynomials/Bernstein-Polynomials.html#conversion
double bernsteinCoeff(int k, int n, int i) {
  return pow(-1, i-k) * choose(n, i) * choose(i, k);
}

IMatrixPtr bezierMatrix(int n) {
  IMatrixPtr B = IMatrixPtr(new Matrix(n, n));

  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n-i; j++) {
      B->set(i, j, bernsteinCoeff(j, n-1, n-i-1));
    }
  }

  return B;
}

IMatrixPtr pointsToMatrix(std::vector<Point> &points) {
  IMatrixPtr R = IMatrixPtr(new Matrix(points.size(), 2));

  for (int i = 0; i < points.size(); i++) {
    R->set(i, 0, points[i].x);
    R->set(i, 1, points[i].y);
  }

  return R;
}

std::vector<Point> matrixToPoints(IMatrixPtr R) {
  std::vector<Point> points(R->getRowsCount());
  
  for (int i = 0; i < R->getRowsCount(); i++) {
    points[i] = Point(R->get(i, 0), R->get(i, 1));
  }

  return points;
}

IMatrixPtr tau(int n, double t) {
  IMatrixPtr T = IMatrixPtr(new Matrix(1, n+1));

  double value = 1.0;
  
  for (int i = n; i >= 0; i--) {
    T->set(0, i, value);
    value *= t;
  }

  return T;
}

void drawBezier(std::vector<Point> &points) {
  static const int samples = 100;

  const int n = points.size();
  IMatrixPtr B = bezierMatrix(n);
  IMatrixPtr R = pointsToMatrix(points);
  IMatrixPtr K = B->nMultiply(R);
  
  glBegin(GL_LINE_STRIP);
  for (int i = 0; i < samples; i++) {
    const double t = 1.0 / (samples-1) * i;

    IMatrixPtr p = tau(n-1, t)->nMultiply(K);
    glVertex2i(std::round(p->get(0, 0)), std::round(p->get(0, 1)));
  }
  glEnd();
}

void drawControlPolygon(std::vector<Point> &points) {
 glBegin(GL_LINE_STRIP);
  for (auto &p : points) {
    glVertex2i(p.x, p.y);
  }
  glEnd();
}

void renderScene() {
  glColor3f(1.0f, 0.0f, 0.0f);

  if (points.size() < 1) return;

  drawControlPolygon(points);

  glColor3f(0.f, 0.f, 1.f);
  
  drawBezier(points);

  // interpolating Bezier curve
  const int n = points.size();
  IMatrixPtr C = pointsToMatrix(points);
  IMatrixPtr T = IMatrixPtr(new Matrix(n, n));
  IMatrixPtr B = bezierMatrix(n);

  for (int i = 0; i < n; i++) {
    IMatrixPtr t = tau(n-1, i / (double) (n-1));
    for (int j = 0; j < n; j++) {
      T->set(i, j, t->get(0, j));
    }
  }

  IMatrixPtr K = T->nMultiply(B);
  IMatrixPtr R = K->nInvert()->nMultiply(C);

  std::vector<Point> interpoints = matrixToPoints(R);
  
  // drawControlPolygon(interpoints);
  drawBezier(interpoints);
}

void keyPressed(unsigned char key, int x, int y) {
  if (key == 27) {
    points.clear();
    glutPostRedisplay();
  }
}

void mousePressedOrReleased(int button, int state, int x, int y) {
  if (button == GLUT_LEFT_BUTTON && state == GLUT_DOWN) {
    points.push_back(Point(x, y));
    glutPostRedisplay();
  } else if (button == GLUT_RIGHT_BUTTON && state == GLUT_DOWN) {
    for (int i = 0; i < points.size(); i++) {
      if (points[i].intersects(x, y)) {
	dragIndex = i;
	isDragging = true;
      }
    } 
  } else if (button == GLUT_RIGHT_BUTTON && state == GLUT_UP) {
    isDragging = false;
  }
}

void mouseDragged(int x, int y) {
  if (isDragging) {
    points[dragIndex].set(x, y);
    glutPostRedisplay();
  }
}
