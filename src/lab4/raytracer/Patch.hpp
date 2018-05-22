#ifndef PATCH_HPP
#define PATCH_HPP

#include "SceneObject.hpp"

class Patch : public SceneObject {
public:
  IVectorPtr center;
  IVectorPtr v1;
  IVectorPtr v2;
  IVectorPtr normal;
  double w;
  double h;

  virtual ~Patch() = default;
  
  virtual void updateIntersection(Intersection &inters, IVectorPtr start, IVectorPtr d) override;
  virtual IVectorPtr getNormalInPoint(IVectorPtr point) override;
};

#endif
