#include "glad/glad.h"
#include <GLFW/glfw3.h>
#include <glm/vec3.hpp>
#include <glm/vec4.hpp>
#include <glm/mat4x4.hpp>
#include <glm/gtc/matrix_transform.hpp>
#include <iostream>

static const char *vertShader = R"(#version 330 core
  layout (location = 0) in vec3 vPosModelSpace;
  out vec3 fragColor;
  uniform mat4 MVP;
  void main() { 
    gl_Position = MVP * vec4(vPosModelSpace, 1.0); 
    fragColor = vec3(1.0, 0.4, 0.7);
  })";
static const char *fragShader = R"(#version 330 core
  uniform vec3 color;
  in vec3 fragColor;
  void main() { 
    gl_FragColor = vec4(fragColor, 1); 
  })";

void error_callback(int error, const char *description) {
  std::cout << "GLFW Error: " << description << std::endl;
}

const char* getError(GLenum err) {
  switch(err) {
                        case GL_INVALID_OPERATION:      return "INVALID_OPERATION";      break;
                        case GL_INVALID_ENUM:           return "INVALID_ENUM";           break;
                        case GL_INVALID_VALUE:          return "INVALID_VALUE";          break;
                        case GL_OUT_OF_MEMORY:          return "OUT_OF_MEMORY";          break;
                        case GL_INVALID_FRAMEBUFFER_OPERATION:  return "INVALID_FRAMEBUFFER_OPERATION";  break;
                }
}

glm::mat4 camera(float Translate, glm::vec2 const& Rotate) {
  glm::mat4 Projection = glm::perspective(glm::radians(60.f), 16.f/9.f, .1f, 100.f);
  glm::mat4 View = glm::lookAt(glm::vec3(glm::sin(Translate) * 10.f, 0.f, glm::cos(Translate) * 10.f), glm::vec3(0.f, 0.f, -20.f), glm::vec3(0.f, 1.f, 0.f));
  //glm::mat4 View = glm::translate(glm::mat4(1.f), glm::vec3(0.f, 0.f, -Translate));
  //View = glm::rotate(View, Rotate.y, glm::vec3(-1.f, 0.f, 0.f));
  //View = glm::rotate(View, Rotate.x, glm::vec3(0.f, 1.f, 0.f));
  glm::mat4 Model = glm::scale(glm::mat4(1.f), glm::vec3(1.f));

  return Projection * View * Model;
}

int main() {
  GLFWwindow *window;

  glfwSetErrorCallback(error_callback);

  if (!glfwInit()) {
    std::cout << "Failed to initialize!" << std::endl;
    return 1;
  }

  glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
  glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
  window = glfwCreateWindow(800, 600, "Simple triangle", NULL, NULL);

  if (!window) {
    std::cout << "Context creation failed!" << std::endl;
    glfwTerminate();
    return 1;
  }

  glfwMakeContextCurrent(window);
  gladLoadGLLoader((GLADloadproc) glfwGetProcAddress);
  glfwSwapInterval(1);

  // OpenGL
  GLuint vertexArrayID, vertexBuffer, indexBuffer;
  GLuint vertexShader, fragmentShader, program;

  const GLfloat vertices[] = {-10.f, 0.f, -20.f, 10.f, 0.f, -20.f, 0.f, 10.f, -20.f, 0.f, -10.f, -20.f,
			      0.f, -10.f, -40.f, 10.f, 0.f, 0.f};
  const GLushort vindices[] = {0, 1, 2, 0, 1, 3, 3, 4, 5, 3, 2, 5};
  
  glGenVertexArrays(1, &vertexArrayID);
  glBindVertexArray(vertexArrayID);

  glGenBuffers(1, &vertexBuffer);
  glBindBuffer(GL_ARRAY_BUFFER, vertexBuffer);

  glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);

  glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 0, (void*) 0);

  glGenBuffers(1, &indexBuffer);
  glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, indexBuffer);
  glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(vindices), vindices, GL_STATIC_DRAW);
  
  vertexShader = glCreateShader(GL_VERTEX_SHADER);
  glShaderSource(vertexShader, 1, &vertShader, NULL);
  glCompileShader(vertexShader);

  GLint success = 0;
  glGetShaderiv(vertexShader, GL_COMPILE_STATUS, &success);

  if (success == GL_FALSE) {
    std::cout << "Vertex shader compilation failed!" << std::endl;
  }

  fragmentShader = glCreateShader(GL_FRAGMENT_SHADER);
  glShaderSource(fragmentShader, 1, &fragShader, NULL);
  glCompileShader(fragmentShader);

  glGetShaderiv(fragmentShader, GL_COMPILE_STATUS, &success);

  if (success == GL_FALSE) {
    std::cout << "Fragment shader compilation failed!" << std::endl;
  }

  program = glCreateProgram();
  glAttachShader(program, vertexShader);
  glAttachShader(program, fragmentShader);
  glLinkProgram(program);

  GLuint MVPMatrixID = glGetUniformLocation(program, "MVP");
  GLuint colorID = glGetUniformLocation(program, "color");
  
  glEnableVertexAttribArray(0);
  
  GLenum err;
  while ((err = glGetError()) != GL_NO_ERROR) {
    std::cout << getError(err) << std::endl;
  }

  while (!glfwWindowShouldClose(window)) {
    glClearColor(.4f, .5f, 1.f, 0.f);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glUseProgram(program);

    double time = glfwGetTime();

    glm::mat4x4 MVP = camera(glm::sin(time), glm::vec2(glm::sin(time) / 1.5f, glm::sin(time) / 5.f));
    glUniformMatrix4fv(MVPMatrixID, 1, GL_FALSE, &MVP[0][0]);

    glm::vec3 color(glm::sin(time) / 5.f, .5f, glm::cos(time));
    glUniform3fv(colorID, 1, &color[0]);
    
    glBindVertexArray(vertexArrayID);
    glEnableVertexAttribArray(0);

    //glDrawArrays(GL_TRIANGLES, 0, 3);
    glDrawElements(GL_TRIANGLES, 6, GL_UNSIGNED_SHORT, (GLvoid*) 0);
    
    glDisableVertexAttribArray(0);
    
    glfwSwapBuffers(window);
    glfwPollEvents();
  }

  glfwDestroyWindow(window);

  glfwTerminate();
  
  return 0;
}
