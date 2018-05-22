#ifndef LIGHT_HPP
#define LIGHT_HPP

#include <IVector.hpp>
#include "Color.hpp"

class Light {
public:
  IVectorPtr position;
  RGBColor rgb;
};

#endif
