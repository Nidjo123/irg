#include "Face3D.h"

#include <sstream>

Face3D::Face3D(int i, int j, int k) {
  indices[0] = i;
  indices[1] = j;
  indices[2] = k;
}

Face3D::Face3D(int *indices) {
  this->indices[0] = indices[0];
  this->indices[1] = indices[1];
  this->indices[2] = indices[2];
}

glm::vec3 Face3D::getNormal() const {
  return glm::vec3(surface.x, surface.y, surface.z);
}

void Face3D::setSurface(const glm::vec4& surface) {
  this->surface = surface;
}

glm::vec4 Face3D::getSurface() const {
  return surface;
}

const int& Face3D::operator[](int index) const {
  return indices[index];
}

std::string Face3D::toString() const {
  std::ostringstream oss;
  oss << "f ";
  oss << (indices[0] + 1) << " " << (indices[1] + 1) << " " << (indices[2] + 1);

  return oss.str();
}
