#include "Patch.hpp"
#include <glm/glm.hpp>

// using glm for speed
void Patch::updateIntersection(Intersection &inters, IVectorPtr start, IVectorPtr d) {
  // ako je normala okomita na smjer zrake
  if (d->scalarProduct(normal) == 0) return; // no intersection

  glm::mat3 vvd;

  vvd[0][0] = v1->get(0);
  vvd[0][1] = v1->get(1);
  vvd[0][2] = v1->get(2);
  vvd[1][0] = v2->get(0);
  vvd[1][1] = v2->get(1);
  vvd[1][2] = v2->get(2);
  vvd[2][0] = -d->get(0);
  vvd[2][1] = -d->get(1);
  vvd[2][2] = -d->get(2);

  // vector from patch center to start
  IVectorPtr scv = start->nSub(center);

  // matrix containing vector start - center
  glm::vec3 sc;

  sc[0] = scv->get(0);
  sc[1] = scv->get(1);
  sc[2] = scv->get(2);

  glm::vec3 res = glm::inverse(vvd) * sc;

  if (res[2] < 0) return; // iza nas

  // granica po širini
  const double boundL = w / 2.0;
  // granica po visini
  const double boundM = h / 2.0;
  
  if (res[0] >= -boundL && res[0] <= boundL &&  res[1] >= -boundM && res[1] <= boundM) {
    // intersection!
    IVectorPtr point = start->nAdd(d->nScalarMultiply(res[2]));

    if (inters.object != nullptr && inters.lambda < res[2]) {
      return;
    }
    
    inters.object = this;
    inters.lambda = res[2];
    inters.point = point;
    inters.front = (normal->scalarProduct(d) < 0);
  }
}

IVectorPtr Patch::getNormalInPoint(IVectorPtr point) {
  return normal;
}
