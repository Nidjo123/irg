#ifndef FACE_3D_H
#define FACE_3D_H

#include <string>
#include <glm/glm.hpp>

class Face3D {
private:
  int indices[3];
  glm::vec4 surface;

public:
  Face3D(int, int, int);
  Face3D(int*);
  Face3D(const Face3D&) = default;

  glm::vec3 getNormal() const;
  void setSurface(const glm::vec4&);
  glm::vec4 getSurface() const;

  const int& operator[](int) const;

  std::string toString() const;
};

#endif
