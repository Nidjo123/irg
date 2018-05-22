#include "OpenGLApp.h"
#include "Shader.h"
#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>
#include <glm/gtc/type_ptr.hpp>
#include <vector>
#include <utility>
#include <algorithm>

struct Point2D {
  GLfloat x, y;

  Point2D() = default;
  
  Point2D(GLfloat x, GLfloat y) : x(x), y(y) {
  }

  Point2D(const Point2D&) = default;

  void set(GLint x, GLint y) {
    this->x = x;
    this->y = y;
  }
};

struct Edge2D {
  Point2D a, b;
  glm::vec3 line;
  bool left;

  Edge2D() = default;

  Edge2D(const Point2D& a, const Point2D& b) : a(a), b(b) {
    glm::vec3 T1(a.x, a.y, 1.0f);
    glm::vec3 T2(b.x, b.y, 1.0f);

    line = glm::cross(T1, T2);
    
    left = a.y >= b.y || (a.y == b.y && a.x >= b.x);
  }
};

class PolygonsApp : public OpenGLApp {
private:
  bool convex;
  bool fill;

  Point2D mousePos;

  enum class State {
    POLYGON_DEFINITION,
    POINT_TESTING
  } state;

  Shader shader;
  GLuint VAO, VBO;
  std::vector<Point2D> vertices;
  
public:
  PolygonsApp() = default;
  
  PolygonsApp(const int width, const int height, const char *title)
    : OpenGLApp(width, height, title), state(State::POLYGON_DEFINITION), shader("vertShader.vertex", "fragShader.fragment") {
    init();
  }

  void init() {    
    glGenVertexArrays(1, &VAO);
    glBindVertexArray(VAO);

    glGenBuffers(1, &VBO);
    glBindBuffer(GL_ARRAY_BUFFER, VBO);

    glVertexAttribPointer(0, 2, GL_FLOAT, GL_FALSE, 0, (GLvoid*) 0);
  }

  void drawPolygonFrame() {
    glBufferData(GL_ARRAY_BUFFER, sizeof(Point2D) * vertices.size(), &vertices[0], GL_DYNAMIC_DRAW);

    glDrawArrays(GL_LINE_LOOP, 0, vertices.size());
  }

  std::vector<Edge2D> verticesToEdges(const std::vector<Point2D> polygon) {
    std::vector<Edge2D> res(polygon.size());

    for (int i = 0; i < polygon.size(); i++) {
      if (i == polygon.size() - 1) {
	res[i] = Edge2D(polygon[i], polygon[0]);
      } else {
	res[i] = Edge2D(polygon[i], polygon[i + 1]);
      }
    }

    return res;
  }

  bool isCW(const std::vector<Point2D>& polygon) {
    for (int i = 0; i < polygon.size() - 1; i++) {
      const Edge2D edge(polygon[i], polygon[i + 1]);

      for (int j = 0; j < i; j++) {
        int res = side(polygon[j], edge.line);
	if (res < 0) return true;
	if (res > 0) return false;
      }

      for (int j = i + 2; j < polygon.size(); j++) {
        int res = side(polygon[j], edge.line);
	if (res < 0) return true;
	if (res > 0) return false;
      }
    }

    const Edge2D edge(polygon[polygon.size() - 1], polygon[0]);

    for (int j = 2; j < polygon.size() - 1; j++) {
      int res = side(polygon[j], edge.line);
      if (res < 0) return true;
      if (res > 0) return false;
    }

    return false;
  }

  bool isCCW(const std::vector<Point2D>& polygon) {
    return !isCW(polygon);
  }
  
  void drawPolygonFilled() {
    if (vertices.size() < 3) return;
    
    float xmin = (float)width, ymin = (float)height, xmax = 0.f, ymax = 0.f;

    std::vector<Edge2D> sides;
    std::vector<std::pair<Point2D, Point2D>> lines;

    std::vector<Point2D> tmpVertices(vertices);

    // ensure clockwise orientation
    if (isCCW(tmpVertices)) {
      std::reverse(tmpVertices.begin(), tmpVertices.end());
    }
    
    // find minmax x and y
    for (int i = 0; i < tmpVertices.size(); i++) {
      const Point2D& p = tmpVertices[i];
      if (p.x < xmin) xmin = p.x;
      if (p.x > xmax) xmax = p.x;
      if (p.y < ymin) ymin = p.y;
      if (p.y > ymax) ymax = p.y;

      if (i < vertices.size() - 1) {
	sides.push_back(Edge2D(tmpVertices[i], tmpVertices[i + 1]));
      } else {
	sides.push_back(Edge2D(tmpVertices[i], tmpVertices[0]));
      }
    }
    
    std::vector<Edge2D> left, right;

    for (auto s : sides) {
      if (s.left) left.push_back(s);
      else right.push_back(s);
    }

    std::sort(left.begin(), left.end(), [](const Edge2D& s1, const Edge2D& s2) {return s1.b.y < s2.b.y || (s1.b.y == s2.b.y && s1.a.x < s2.a.x);});
    std::sort(right.begin(), right.end(), [](const Edge2D& s1, const Edge2D& s2) {return s1.a.y < s2.a.y;});

    int li, ri;
    float L = xmin, D = xmax, x;
    
    li = ri = 0;
    
    for (int y = ymin; y <= ymax; y++) {
      // find intersections of horizontal ray at y with polygon sides
      // c, x, y; c + x + y = 0
      glm::vec3 ray(0.0f, 1.f, (float)-y);
      
      const Edge2D& leftS = left[li];
      const Edge2D& rightS = right[ri];

      if (leftS.a.y == leftS.b.y) {
	lines.push_back(std::make_pair(Point2D(leftS.a.x, y), Point2D(leftS.b.x, y)));
	li++;
	continue;
      }
      if (rightS.a.y == rightS.b.y) {
	lines.push_back(std::make_pair(Point2D(rightS.b.x, y), Point2D(rightS.a.x, y)));
	ri++;
	continue;
      }

      glm::vec3 leftIntersection = glm::cross(ray, leftS.line);
      glm::vec3 rightIntersection = glm::cross(ray, rightS.line);
      
      L = leftIntersection.x / leftIntersection.z;
      D = rightIntersection.x / rightIntersection.z;

      /*
      for (int i = 0; i < left.size(); i++) {
	glm::vec3 intersection = glm::cross(ray, left[i].line);
	if (std::abs(intersection.z) < 1e-6f) continue;
	L = std::max(L, intersection.x / intersection.z);
      }

      for (int i = 0; i < right.size(); i++) {
	glm::vec3 intersection = glm::cross(ray, right[i].line);
	if (std::abs(intersection.z) < 1e-6f) continue;
	D = std::min(D, intersection.x / intersection.z);
      }
      */
      if (leftS.a.y == y) li++;
      if (rightS.b.y == y) ri++;

      lines.push_back(std::make_pair(Point2D(L, y), Point2D(D, y)));
    }

    glBufferData(GL_ARRAY_BUFFER, sizeof(std::pair<Point2D, Point2D>) * lines.size(), &lines[0], GL_DYNAMIC_DRAW);
    glDrawArrays(GL_LINES, 0, lines.size() * 2);
  }
  
  void render(float time) {
    if (convex) {
      glClearColor(0.f, 1.f, 0.f, 1.f);
    } else {
      glClearColor(1.f, 1.f, 1.f, 1.f);
    }
    glClear(GL_COLOR_BUFFER_BIT);

    glm::mat4 Projection = glm::ortho(0.f, (float)width, (float)height, 0.f);
    
    shader.use();

    if (state == State::POLYGON_DEFINITION) {
      vertices.push_back(mousePos);
    }

    if (fill) {
      drawPolygonFilled();
    } else {
      drawPolygonFrame();
    }
    
    GLint MVPLocation = glGetUniformLocation(shader.program, "MVP");

    glUniformMatrix4fv(MVPLocation, 1, GL_FALSE, glm::value_ptr(Projection));
    
    glEnableVertexAttribArray(0);

    if (state == State::POLYGON_DEFINITION) {
      vertices.erase(vertices.end() - 1);
    }
    
  }

  void tick(float time) {

  }

  static int sign(float x) {
    if (std::abs(x) < 1e-6) return 0;
    return (x < 0) ? -1 : +1;
  }
  
  static int side(const Point2D& p, const glm::vec3& line) {
    return sign(glm::dot(glm::vec3(p.x, p.y, 1.0f), line));
  }

  static bool checkConvex(const std::vector<Point2D>& polygon) {
    // always convex
    if (polygon.size() <= 3) return true;

    int polygonSide = -2, currentSide;
    
    for (int i = 0; i < polygon.size(); i++) {
      // line
      Point2D a = polygon[i];
      Point2D b;
      
      if (i == polygon.size() - 1) {
	b = polygon[0];
      } else {
	b = polygon[i + 1];
      }
      
      glm::vec3 T1(a.x, a.y, 1.0f);
      glm::vec3 T2(b.x, b.y, 1.0f);

      glm::vec3 line = glm::cross(T1, T2);
      
      for (int j = 0; j < i; j++) {
	currentSide = side(polygon[j], line);
	
	if (polygonSide == -2 || polygonSide == 0) {
	  polygonSide = currentSide;
	} else if (polygonSide != currentSide && currentSide != 0) {
	  return false;
	}
      }

      for (int j = i + 2; j < polygon.size(); j++) {
	currentSide = side(polygon[j], line);
	if (polygonSide == -2 || polygonSide == 0) {
	  polygonSide = currentSide;
	} else if (polygonSide != currentSide && currentSide != 0) {
	  return false;
	}
      }
    }

    return true;
  }

  static bool isPointInside(const Point2D& p, const std::vector<Point2D>& polygon) {
    int pointSide = -2;
    
    for (int i = 0; i < polygon.size(); i++) {
      // line
      Point2D a = polygon[i];
      Point2D b;
      
      if (i == polygon.size() - 1) {
	b = polygon[0];
      } else {
	b = polygon[i + 1];
      }
      
      glm::vec3 T1(a.x, a.y, 1.0f);
      glm::vec3 T2(b.x, b.y, 1.0f);

      glm::vec3 line = glm::cross(T1, T2);

      int res = side(p, line);

      if (res == 0) continue;

      if (pointSide == -2) {
	pointSide = res;
      } else if (pointSide != res) {
	return false;
      }
    }

    return true;
  }

  void toggleConvex() {
    convex = !convex;
  }

  void toggleFill() {
    fill = !fill;
  }

  void nextState() {
    switch (state) {
    case State::POLYGON_DEFINITION:
      state = State::POINT_TESTING;
      break;
    case State::POINT_TESTING:
      state = State::POLYGON_DEFINITION;
      vertices.clear();
      break;
    default:
      state = State::POLYGON_DEFINITION;
      break;
    }
  }

  void setMousePos(GLfloat x, GLfloat y) {
    mousePos.set(x, y);
  }

  void mouseClick() {
    if (state == State::POLYGON_DEFINITION) {
      std::vector<Point2D> polygon(vertices);
      polygon.push_back(mousePos);
      if (!convex || checkConvex(polygon)) {
	vertices.push_back(mousePos);
      } else {
	std::cout << "Tocka (" << mousePos.x << ", " << mousePos.y << ") nije dodana zbog konveksnosti" << std::endl;
      }
    } else if (state == State::POINT_TESTING) {
      std::cout << "Tocka (" << mousePos.x << ", " << mousePos.y << ") ";
      if (isPointInside(mousePos, vertices)) {
	std::cout << "je unutar poligona" << std::endl;
      } else {
	std::cout << "nije unutar poligona" << std::endl;
      }
    }
  }
} *app;

void key_callback(GLFWwindow *window, int key, int scancode, int action, int mods) {
  if (key == GLFW_KEY_K && action == GLFW_PRESS) {
    app->toggleConvex();
  }

  if (key == GLFW_KEY_P && action == GLFW_PRESS) {
    app->toggleFill();
  }

  if (key == GLFW_KEY_N && action == GLFW_PRESS) {
    app->nextState();
  }
}

void cursor_pos_callback(GLFWwindow *window, double x, double y) {
  app->setMousePos((GLint) x, (GLint) y);
}

void mouse_button_callback(GLFWwindow *window, int button, int action, int mods) {
  if (button == GLFW_MOUSE_BUTTON_LEFT && action == GLFW_PRESS) {
    app->mouseClick();
  }
}

void framebuffer_size_callback(GLFWwindow *window, int width, int height) {
  glViewport(0, 0, width, height);
  app->setWidth(width);
  app->setHeight(height);
}


int main() {
  OpenGLApp::initialize();
  app = new PolygonsApp(400, 400, "Poligoni");

  app->registerKeyCallback(key_callback);
  app->registerCursorPosCallback(cursor_pos_callback);
  app->registerMouseButtonCallback(mouse_button_callback);
  app->registerFramebufferSizeCallback(framebuffer_size_callback);

  app->start();

  delete app;
  
  return 0;
}
