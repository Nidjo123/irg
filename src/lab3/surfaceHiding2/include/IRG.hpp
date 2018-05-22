#ifndef IRG_HPP
#define IRG_HPP

#include <IMatrix.hpp>
#include <IVector.hpp>

class IRG {
public:
  static IMatrixPtr identity(int n);
  static IMatrixPtr translate3D(double dx, double dy, double dz);
  static IMatrixPtr scale3D(double sx, double sy, double sz);
  static IMatrixPtr lookAtMatrix(IVectorPtr eye, IVectorPtr center, IVectorPtr viewUp);
  static IMatrixPtr lookAtMatrix2(IVectorPtr eye, IVectorPtr center, IVectorPtr viewUp);
  static IMatrixPtr buildFrustumMatrix(double l, double r, double b, double t, double n, double f);
  static bool isCCW(IVectorPtr v1, IVectorPtr v2, IVectorPtr v3);
};

#endif
