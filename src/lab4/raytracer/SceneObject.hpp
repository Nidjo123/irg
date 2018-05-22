#ifndef SCENE_OBJECT_HPP
#define SCENE_OBJECT_HPP

#include <IVector.hpp>
#include "Color.hpp"
#include "Intersection.hpp"

// predef
class Intersection;

class SceneObject {
public:
  // parametri prednje strane
  RGBColor fambRGB;
  RGBColor fdifRGB;
  RGBColor frefRGB;
  double fn;
  double fkref;

  // parametri stražnje strane
  RGBColor bambRGB;
  RGBColor bdifRGB;
  RGBColor brefRGB;
  double bn;
  double bkref;

  virtual ~SceneObject() = default;

  virtual void updateIntersection(Intersection &inters, IVectorPtr start, IVectorPtr d) = 0;
  virtual IVectorPtr getNormalInPoint(IVectorPtr point) = 0;
};

#endif
