#version 330 core

layout (location = 0) in vec3 pos;
layout (location = 1) in vec3 col;
out vec3 fragCol;
uniform mat4 MVP;

void main() {
  gl_Position = MVP * vec4(pos, 1.0);
  fragCol = col;
}