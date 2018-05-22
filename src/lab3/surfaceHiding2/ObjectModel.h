#ifndef OBJECT_MODEL_H
#define OBJECT_MODEL_H

#include <string>
#include <vector>
#include "Face3D.h"
#include "Vertex3D.h"
#include <IVector.hpp>

class ObjectModel {
private:
  std::vector<Vertex3D> vertices;
  std::vector<Face3D> faces;

public:
  ObjectModel() = default;
  ObjectModel(std::string);
  ObjectModel(const ObjectModel&) = default;

  const std::vector<Vertex3D>& getVertices() const;
  std::vector<Face3D>& getFaces();
  
  void normalize();

  int testPoint(float x, float y, float z) const;
  int testPoint(const Vertex3D&) const;

  void determineFaceVisibilities1(IVectorPtr eye);
  void determineFaceVisibilities2(IVectorPtr eye);

  std::string dumpToOBJ() const;

private:
  void calculateSurfaces();
};

#endif
