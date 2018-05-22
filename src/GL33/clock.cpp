#include "glad/glad.h"
#include <GLFW/glfw3.h>
#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>
#include <glm/gtx/transform.hpp>
#include <iostream>

static const char *vertShader = R"(
  #version 330 core
  layout (location = 0) in vec3 pos;
  layout (location = 1) in vec3 col;
  out vec3 fragCol;
  uniform mat4 MVP;
  void main() {
    gl_Position = MVP * vec4(pos, 1.0);
    fragCol = col;
  }
)";

static const char *fragShader = R"(
  #version 330 core
  in vec3 fragCol;
  void main() {
    gl_FragColor = vec4(fragCol, 1.0);
  }
)";

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

int main() {
  GLFWwindow *window;

  glfwSetErrorCallback(error_callback);

  if (!glfwInit()) {
    std::cout << "Failed to initialize GLFW!" << std::endl;
    return 1;
  }

  glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
  glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
  window = glfwCreateWindow(800, 600, "Triangle vertex colors", NULL, NULL);

  if (!window) {
    std::cout << "Context creation failed!" << std::endl;
    glfwTerminate();
    return 1;
  }

  glfwMakeContextCurrent(window);
  gladLoadGLLoader((GLADloadproc) glfwGetProcAddress);
  glfwSwapInterval(1);


  /* ========== OpenGL ========== */
  GLuint VAO, vertexBuffer;
  GLuint vertexShader, fragmentShader, program;
  GLint success;
  
  GLfloat vertices[] = {-0.5f, -0.5f, 0.0f, 1.0f, 0.f, 0.f,
			0.5f, -0.5f, 0.0f, 0.f, 1.0f, .0f,
			0.0f, 0.5f, 0.0f, 0.f, 0.f, 1.f};
  
  glGenVertexArrays(1, &VAO);
  glBindVertexArray(VAO);

  glGenBuffers(1, &vertexBuffer);
  glBindBuffer(GL_ARRAY_BUFFER, vertexBuffer);

  glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);
  glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 6 * sizeof(GLfloat), (GLvoid*) 0);
  glVertexAttribPointer(1, 3, GL_FLOAT, GL_FALSE, 6 * sizeof(GLfloat), (GLvoid*) (3 * sizeof(GLfloat)));

  vertexShader = glCreateShader(GL_VERTEX_SHADER);
  glShaderSource(vertexShader, 1, &vertShader, NULL);
  glCompileShader(vertexShader);

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

  GLuint MVPLocation = glGetUniformLocation(program, "MVP");
  glEnableVertexAttribArray(0);
  glEnableVertexAttribArray(1);

  GLenum err;

  while ((err = glGetError()) != GL_NO_ERROR) {
    std::cout << getError(err) << std::endl;
  }

  while (!glfwWindowShouldClose(window)) {
    glClearColor(.0f, .0f, .0f, .0f);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

    float time = glfwGetTime();

    glm::mat4 Projection = glm::perspective(glm::radians(45.f), 4.f / 3.f, .1f, 100.f);
    glm::mat4 View = glm::lookAt(glm::vec3(0.f, 1.75f, -10.f), glm::vec3(0.f, 1.f, 10.f), glm::vec3(0.f, 1.f, 0.f));
    glm::mat4 Model = glm::mat4(1.f);
    Model = glm::rotate(Model, time, glm::vec3(0.f, 0.f, 1.f));
    Model = glm::translate(Model, glm::vec3(0.f, 0.f, glm::cos(time) * 5.f));

    glm::mat4 MVP = Projection * View * Model;
    
    glUseProgram(program);

    glUniformMatrix4fv(MVPLocation, 1, GL_FALSE, &MVP[0][0]);

    glBindVertexArray(VAO);

    glDrawArrays(GL_TRIANGLES, 0, 3);
    
    glBindVertexArray(0);

    glfwSwapBuffers(window);
    glfwPollEvents();
  }


  glfwDestroyWindow(window);
  glfwTerminate();
  
  return 0;
}





















































































#include "glad/glad.h"
#include <GLFW/glfw3.h>
#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>
#include <glm/gtx/transform.hpp>
#include <iostream>

static const char *vertShader = R"(
  #version 330 core
  layout (location = 0) in vec3 pos;
  layout (location = 1) in vec3 col;
  out vec3 fragCol;
  uniform mat4 MVP;
  void main() {
    gl_Position = MVP * vec4(pos, 1.0);
    fragCol = col;
  }
)";

static const char *fragShader = R"(
  #version 330 core
  in vec3 fragCol;
  void main() {
    gl_FragColor = vec4(fragCol, 1.0);
  }
)";

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

int main() {
  GLFWwindow *window;

  glfwSetErrorCallback(error_callback);

  if (!glfwInit()) {
    std::cout << "Failed to initialize GLFW!" << std::endl;
    return 1;
  }

  glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
  glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
  window = glfwCreateWindow(800, 600, "Triangle vertex colors", NULL, NULL);

  if (!window) {
    std::cout << "Context creation failed!" << std::endl;
    glfwTerminate();
    return 1;
  }

  glfwMakeContextCurrent(window);
  gladLoadGLLoader((GLADloadproc) glfwGetProcAddress);
  glfwSwapInterval(1);


  /* ========== OpenGL ========== */
  GLuint VAO, vertexBuffer;
  GLuint vertexShader, fragmentShader, program;
  GLint success;
  
  GLfloat vertices[] = {-0.5f, -0.5f, 0.0f, 1.0f, 0.f, 0.f,
			0.5f, -0.5f, 0.0f, 0.f, 1.0f, .0f,
			0.0f, 0.5f, 0.0f, 0.f, 0.f, 1.f};
  
  glGenVertexArrays(1, &VAO);
  glBindVertexArray(VAO);

  glGenBuffers(1, &vertexBuffer);
  glBindBuffer(GL_ARRAY_BUFFER, vertexBuffer);

  glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);
  glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 6 * sizeof(GLfloat), (GLvoid*) 0);
  glVertexAttribPointer(1, 3, GL_FLOAT, GL_FALSE, 6 * sizeof(GLfloat), (GLvoid*) (3 * sizeof(GLfloat)));

  vertexShader = glCreateShader(GL_VERTEX_SHADER);
  glShaderSource(vertexShader, 1, &vertShader, NULL);
  glCompileShader(vertexShader);

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

  GLuint MVPLocation = glGetUniformLocation(program, "MVP");
  glEnableVertexAttribArray(0);
  glEnableVertexAttribArray(1);

  GLenum err;

  while ((err = glGetError()) != GL_NO_ERROR) {
    std::cout << getError(err) << std::endl;
  }

  while (!glfwWindowShouldClose(window)) {
    glClearColor(.0f, .0f, .0f, .0f);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

    float time = glfwGetTime();

    glm::mat4 Projection = glm::perspective(glm::radians(45.f), 4.f / 3.f, .1f, 100.f);
    glm::mat4 View = glm::lookAt(glm::vec3(0.f, 1.75f, -10.f), glm::vec3(0.f, 1.f, 10.f), glm::vec3(0.f, 1.f, 0.f));
    glm::mat4 Model = glm::mat4(1.f);
    Model = glm::rotate(Model, time, glm::vec3(0.f, 0.f, 1.f));
    Model = glm::scale(Model, glm::vec3(2.f * (glm::cos(time) / 2 + 0.5), 2.f, 1.f));

    glm::mat4 MVP = Projection * View * Model;
    
    glUseProgram(program);

    glUniformMatrix4fv(MVPLocation, 1, GL_FALSE, &MVP[0][0]);

    glBindVertexArray(VAO);

    glDrawArrays(GL_TRIANGLES, 0, 3);
    
    glBindVertexArray(0);

    glfwSwapBuffers(window);
    glfwPollEvents();
  }


  glfwDestroyWindow(window);
  glfwTerminate();
  
  return 0;
}



