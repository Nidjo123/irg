#ifndef OBJECT_MODEL_H
#define OBJECT_MODEL_H

#include <string>
#include <vector>
#include "Face3D.h"
#include "Vertex3D.h"

class ObjectModel {
private:
  std::vector<Vertex3D> vertices;
  std::vector<Face3D> faces;

public:
  ObjectModel() = default;
  ObjectModel(std::string);
  ObjectModel(const ObjectModel&) = default;

  const std::vector<Vertex3D>& getVertices() const;
  const std::vector<Face3D>& getFaces() const;
  
  void normalize();

  int testPoint(float x, float y, float z) const;
  int testPoint(const Vertex3D&) const;

  std::string dumpToOBJ() const;

private:
  void calculateSurfaces();
};

#endif
