#ifndef SPHERE_HPP
#define SPHERE_HPP

#include "SceneObject.hpp"

class Sphere : public SceneObject {
public:
  IVectorPtr center;
  double radius;

  virtual ~Sphere() = default;

  virtual void updateIntersection(Intersection &inters, IVectorPtr start, IVectorPtr d) override;
  virtual IVectorPtr getNormalInPoint(IVectorPtr point) override;
};

#endif
