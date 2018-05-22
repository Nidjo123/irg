#ifndef SHADER_H
#define SHADER_H

#include <string>
#include <fstream>
#include <sstream>
#include <iostream>

#include "glad/glad.h"

#define INFO_LOG_SIZE 512

class Shader {
private:
  void compileAndLink(const GLchar *vertexCode, const GLchar *fragmentCode);
public:
  Shader(const GLchar *vertexPath, const GLchar *fragmentPath);

  void use() const;

  GLuint program;
};

Shader::Shader(const GLchar *vertexPath, const GLchar *fragmentPath) {
  std::string vertexCode, fragmentCode;
  std::ifstream vShaderFile, fShaderFile;

  vShaderFile.exceptions(std::ifstream::failbit | std::ifstream::badbit);
  fShaderFile.exceptions(std::ifstream::failbit | std::ifstream::badbit);

  try {
    vShaderFile.open(vertexPath);
    fShaderFile.open(fragmentPath);

    std::stringstream vShaderStream, fShaderStream;
    vShaderStream << vShaderFile.rdbuf();
    fShaderStream << fShaderFile.rdbuf();

    vShaderFile.close();
    fShaderFile.close();

    vertexCode = vShaderStream.str();
    fragmentCode = fShaderStream.str();

  } catch (std::istream::failure e) {
    std::cout << "ERROR: can't read shader file!" << std::endl;
  }

  const GLchar *vShaderCode = vertexCode.c_str();
  const GLchar *fShaderCode = fragmentCode.c_str();

  compileAndLink(vShaderCode, fShaderCode);
}

void Shader::compileAndLink(const GLchar *vertexCode, const GLchar *fragmentCode) {
  GLuint vertexShader, fragmentShader;
  GLint success;
  GLchar infoLog[INFO_LOG_SIZE];

  vertexShader = glCreateShader(GL_VERTEX_SHADER);
  glShaderSource(vertexShader, 1, &vertexCode, NULL);
  glCompileShader(vertexShader);

  glGetShaderiv(vertexShader, GL_COMPILE_STATUS, &success);
  if (success == GL_FALSE) {
    glGetShaderInfoLog(vertexShader, INFO_LOG_SIZE, NULL, infoLog);
    std::cout << "ERROR: Vertex shader compilation failed with message:\n" << infoLog << std::endl;
  }

  fragmentShader = glCreateShader(GL_FRAGMENT_SHADER);
  glShaderSource(fragmentShader, 1, &fragmentCode, NULL);
  glCompileShader(fragmentShader);

  glGetShaderiv(fragmentShader, GL_COMPILE_STATUS, &success);
  if (success == GL_FALSE) {
    glGetShaderInfoLog(fragmentShader, INFO_LOG_SIZE, NULL, infoLog);
    std::cout << "ERROR: Fragment shader compilation failed with message:\n" << infoLog << std::endl;
  }

  program = glCreateProgram();
  glAttachShader(program, vertexShader);
  glAttachShader(program, fragmentShader);
  glLinkProgram(program);

  glGetProgramiv(program, GL_LINK_STATUS, &success);
  if (success == GL_FALSE) {
    glGetProgramInfoLog(program, INFO_LOG_SIZE, NULL, infoLog);
    std::cout << "ERROR: Program linking failed with message:\n" << infoLog << std::endl;
  }

  glDeleteShader(vertexShader);
  glDeleteShader(fragmentShader);
}

void Shader::use() const {
  glUseProgram(this->program);
}

#endif
