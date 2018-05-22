#include "OpenGLApp.h"

void default_error_callback(int error, const char *description) {
  std::cout << "GLFW Error(" << error << "): " << description << std::endl;
}

OpenGLApp::OpenGLApp(const int width, const int height, const char *title)
  : width(width), height(height) {

  registerErrorCallback(default_error_callback);

  glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
  glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
  window = glfwCreateWindow(width, height, title, NULL, NULL);

  if (!window) {
    std::cout << "Context creation failed!" << std::endl;
    glfwTerminate();
  } else {
    glfwMakeContextCurrent(window);
    gladLoadGLLoader((GLADloadproc) glfwGetProcAddress);
    glfwSwapInterval(1);
  }
}

OpenGLApp::~OpenGLApp() {
  if (window) {
    glfwDestroyWindow(window);
  }

  glfwTerminate();
}

void OpenGLApp::initialize() {
  if (!glfwInit()) {
    std::cout << "Failed to initialize GLFW!" << std::endl;
  }
}

void OpenGLApp::start() {
  double time = 0.0;
  
  while (!glfwWindowShouldClose(window)) {
    double current = glfwGetTime();
    double elapsed = current - time;
    time = current;

    tick(elapsed);

    render(elapsed);

    glfwSwapBuffers(window);
    glfwPollEvents();
  }
}

int OpenGLApp::getWidth() const {
  return width;
}

int OpenGLApp::getHeight() const {
  return height;
}

void OpenGLApp::setWidth(const int width) {
  this->width = width;
}

void OpenGLApp::setHeight(const int height) {
  this->height = height;
}

void OpenGLApp::registerErrorCallback(error_callback_fun function) {
  glfwSetErrorCallback(function);
}

void OpenGLApp::registerKeyCallback(key_callback_fun function) {
  glfwSetKeyCallback(window, function);
}

void OpenGLApp::registerCharCallback(char_callback_fun function) {
  glfwSetCharCallback(window, function);
}

void OpenGLApp::registerCursorPosCallback(cursor_pos_callback_fun function) {
  glfwSetCursorPosCallback(window, function);
}

void OpenGLApp::registerCursorEnterCallback(cursor_enter_callback_fun function) {
  glfwSetCursorEnterCallback(window, function);
}

void OpenGLApp::registerMouseButtonCallback(mouse_button_callback_fun function) {
  glfwSetMouseButtonCallback(window, function);
}

void OpenGLApp::registerScrollCallback(scroll_callback_fun function) {
  glfwSetScrollCallback(window, function);
}

void OpenGLApp::registerWindowSizeCallback(window_size_callback_fun function) {
  glfwSetWindowSizeCallback(window, function);
}

void OpenGLApp::registerFramebufferSizeCallback(framebuffer_size_callback_fun function) {
  glfwSetFramebufferSizeCallback(window, function);
}

void OpenGLApp::registerWindowRefreshCallback(window_refresh_callback_fun function) {
  glfwSetWindowRefreshCallback(window, function);
}

const char* getError(GLenum error) {
  switch(error) {
  case GL_INVALID_OPERATION:      return "INVALID_OPERATION";      break;
  case GL_INVALID_ENUM:           return "INVALID_ENUM";           break;
  case GL_INVALID_VALUE:          return "INVALID_VALUE";          break;
  case GL_OUT_OF_MEMORY:          return "OUT_OF_MEMORY";          break;
  case GL_INVALID_FRAMEBUFFER_OPERATION:  return "INVALID_FRAMEBUFFER_OPERATION";  break;
  }
}
