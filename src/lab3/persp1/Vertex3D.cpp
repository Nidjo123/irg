#include "Vertex3D.h"

#include <sstream>

Vertex3D::Vertex3D(float x, float y, float z) : x(x), y(y), z(z) {

}

float Vertex3D::getX() const {
  return x;
}

float Vertex3D::getY() const {
  return y;
}

float Vertex3D::getZ() const {
  return z;
}

void Vertex3D::translate(float xd, float yd, float zd) {
  x += xd;
  y += yd;
  z += zd;
}

void Vertex3D::scale(float s) {
  x *= s;
  y *= s;
  z *= s;
}

std::string Vertex3D::toString() const {
  std::ostringstream oss;
  oss << "v ";
  oss << x << " " << y << " " << z;

  return oss.str();
}
