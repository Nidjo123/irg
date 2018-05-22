#ifndef INTERSECTION_HPP
#define INTERSECTION_HPP

#include "SceneObject.hpp"

// predef
class SceneObject;

class Intersection {
public:
  SceneObject *object = nullptr; // najbliži objekt s kojim se zraka sječe
  double lambda; // lambda za koji se to događa
  bool front; // sjecište na prednjoj strani?
  IVectorPtr point; // točka sjecišta
};

#endif
