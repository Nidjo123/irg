#ifndef VERTEX_3D_H
#define VERTEX_3D_H

#include <string>

class Vertex3D {
private:
  float x, y, z;

public:
  Vertex3D(float, float, float);
  Vertex3D(const Vertex3D&) = default;

  float getX() const;
  float getY() const;
  float getZ() const;

  void translate(float, float, float);
  void scale(float);

  std::string toString() const;
};

#endif
