#ifndef OPENGL_APP_H
#define OPENGL_APP_H

#include "glad/glad.h"
#include <GLFW/glfw3.h>
#include <iostream>

typedef void (*error_callback_fun)(int, const char*);
typedef void (*key_callback_fun)(GLFWwindow*, int, int, int, int);
typedef void (*char_callback_fun)(GLFWwindow*, unsigned int);
typedef void (*cursor_pos_callback_fun)(GLFWwindow*, double, double);
typedef void (*cursor_enter_callback_fun)(GLFWwindow*, int);
typedef void (*mouse_button_callback_fun)(GLFWwindow*, int, int, int);
typedef void (*scroll_callback_fun)(GLFWwindow*, double, double);
typedef void (*window_size_callback_fun)(GLFWwindow*, int, int);
typedef void (*framebuffer_size_callback_fun)(GLFWwindow*, int, int);
typedef void (*window_refresh_callback_fun)(GLFWwindow*);

class OpenGLApp {
protected:
  GLFWwindow *window;
  int width;
  int height;

public:
  OpenGLApp() = default;
  OpenGLApp(const OpenGLApp&) = default;
  OpenGLApp(const int width, const int height, const char *title);

  virtual ~OpenGLApp();

  virtual void render(float time) = 0;

  virtual void tick(float time) = 0;

  void start();

  int getWidth() const;
  int getHeight() const;
  
  void setWidth(const int width);
  void setHeight(const int height);

  void registerErrorCallback(error_callback_fun);//(int error, const char *description)

  void registerKeyCallback(key_callback_fun);//(GLFWwindow *window, int key, int scancode, int action, int mods)

  void registerCharCallback(char_callback_fun);//(GLFWwindow *window, unsigned int codepoint)

  void registerCursorPosCallback(cursor_pos_callback_fun);//(GLFWwindow *window, double x, double y)

  void registerCursorEnterCallback(cursor_enter_callback_fun);//(GLFWwindow *window, int entered)

  void registerMouseButtonCallback(mouse_button_callback_fun);//(GLFWwindow *window, int button, int action, int mods)

  void registerScrollCallback(scroll_callback_fun);//(GLFWwindow *window, double xoffs, double yoffs)

  void registerWindowSizeCallback(window_size_callback_fun);//(GLFWwindow *window, int width, int height)

  void registerFramebufferSizeCallback(framebuffer_size_callback_fun);//(GLFWwindow *window, int width, int height)

  void registerWindowRefreshCallback(window_refresh_callback_fun);//(GLFWwindow *window)

  static void initialize();
};


const char* getError(GLenum error); 

void default_error_callback(int error, const char *description);

#endif
