#include "Sphere.hpp"
#include <cmath>

void Sphere::updateIntersection(Intersection &inters, IVectorPtr start, IVectorPtr d) {
  // find intersection
  IVectorPtr Cstart = start->nSub(center);
  // a = 1
  double b = 2 * d->scalarProduct(Cstart);
  double c = Cstart->scalarProduct(Cstart) - radius * radius;

  double k = b*b - 4*c;

  if (k < 0) return; // no intersection

  k = sqrt(k);

  double lambda1 = 0.5 * (-b + k);
  double lambda2 = 0.5 * (-b - k);

  double lambda = lambda1;

  if (lambda2 < lambda || lambda < 0) lambda = lambda2;
  
  if (lambda > 0) {
    IVectorPtr point = start->nAdd(d->nScalarMultiply(lambda));
    
    if (inters.object != nullptr && inters.lambda < lambda) {
      return;
    }

    inters.object = this;
    inters.lambda = lambda;
    inters.point = point;
    inters.front = true;
  }
}

IVectorPtr Sphere::getNormalInPoint(IVectorPtr point) {
  // return normalized vector from center to point
  return point->nSub(center)->normalize();
}
