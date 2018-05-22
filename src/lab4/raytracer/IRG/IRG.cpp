#include <cmath>
#include <IRG.hpp>
#include <Matrix.hpp>

IMatrixPtr IRG::identity(int n) {
  IMatrixPtr M = IMatrixPtr(new Matrix(n, n));

  for (int i = 0; i < n; i++) {
    M->set(i, i, 1.0);
  }

  return M;
}

IMatrixPtr IRG::translate3D(double dx, double dy, double dz) {
  IMatrixPtr T = identity(4);

  T->set(3, 0, dx);
  T->set(3, 1, dy);
  T->set(3, 2, dz);

  return T;
}

IMatrixPtr IRG::scale3D(double sx, double sy, double sz) {
  IMatrixPtr S = identity(4);
  
  S->set(0, 0, sx);
  S->set(1, 1, sy);
  S->set(2, 2, sz);

  return S;
}

// translate everything so that eye is origin
IMatrixPtr IRG::lookAtMatrix(IVectorPtr eye, IVectorPtr center, IVectorPtr viewUp) {
  IMatrixPtr lookAt = identity(4);
  IVectorPtr dir = center->nSub(eye)->normalize();
  IVectorPtr G = center->toHomogeneous();
  IVectorPtr yDir = viewUp->nSub(dir->scalarMultiply(viewUp->scalarProduct(dir)));
  IVectorPtr K = eye->nAdd(yDir)->toHomogeneous();
  
  // translate everything so origin is at eye
  IMatrixPtr T = translate3D(-eye->get(0), -eye->get(1), -eye->get(2));

  G = G->toRowMatrix(false)->nMultiply(T)->toVector(false);
  double Gx = -G->get(0);
  double Gy = -G->get(1);
  double Gz = -G->get(2);
  
  // rotate Z' to X-Z plane
  const double lena = sqrt(pow(Gx, 2) + pow(Gy, 2));
  const double sina = Gy / lena;
  const double cosa = Gx / lena;

  IMatrixPtr R1 = identity(4);
  R1->set(0, 0, cosa);
  R1->set(0, 1, -sina);
  R1->set(1, 0, sina);
  R1->set(1, 1, cosa);

  G = G->toRowMatrix(false)->nMultiply(R1)->toVector(false);
  Gx = -G->get(0);
  Gy = -G->get(1);
  Gz = -G->get(2);
  
  // rotate Z' to match with Z
  const double lenb = sqrt(pow(Gx, 2) + pow(Gy, 2) + pow(Gz, 2));
  const double sinb = lena / lenb;
  const double cosb = Gz / lenb;

  IMatrixPtr R2 = identity(4);
  R2->set(0, 0, cosb);
  R2->set(0, 2, sinb);
  R2->set(2, 0, -sinb);
  R2->set(2, 2, cosb);

  // project viewUp onto view plane
  K = K->toRowMatrix(false)->nMultiply(T)->nMultiply(R1)->nMultiply(R2)->toVector(false);

  // rotate yAxis to match with y-axis and we're done
  const double Kx = K->get(0);
  const double Ky = K->get(1);
  const double lenc = sqrt(pow(Kx, 2) + pow(Ky, 2));
  const double sinc = -Kx / lenc;
  const double cosc = Ky / lenc;

  IMatrixPtr R3 = identity(4);
  R3->set(0, 0, cosc);
  R3->set(0, 1, -sinc);
  R3->set(1, 0, sinc);
  R3->set(1, 1, cosc);

  return T->nMultiply(R1)->nMultiply(R2)->nMultiply(R3);
}

IMatrixPtr IRG::lookAtMatrix2(IVectorPtr eye, IVectorPtr center, IVectorPtr viewUp) {
  IVectorPtr forward = center->nSub(eye)->normalize()->negate();
  IVectorPtr up = viewUp->nSub(forward->nScalarMultiply(forward->scalarProduct(viewUp)))->normalize();
  IVectorPtr right = up->nVectorProduct(forward)->normalize();

  IMatrixPtr M = identity(4);

  // x axis
  M->set(0, 0, right->get(0));
  M->set(1, 0, right->get(1));
  M->set(2, 0, right->get(2));

  // y axis
  M->set(0, 1, up->get(0));
  M->set(1, 1, up->get(1));
  M->set(2, 1, up->get(2));

  // z axis
  M->set(0, 2, forward->get(0));
  M->set(1, 2, forward->get(1));
  M->set(2, 2, forward->get(2));

  // translation from eye to origin
  M->set(3, 0, -right->scalarProduct(eye));
  M->set(3, 1, -up->scalarProduct(eye));
  M->set(3, 2, -forward->scalarProduct(eye));

  return M;
}

IMatrixPtr IRG::buildFrustumMatrix(double l, double r, double b, double t, double n, double f) {
  IMatrixPtr M = IMatrixPtr(new Matrix(4, 4));

  M->set(0, 0, 2*n/(r-l));
  M->set(2, 0, (r+l)/(r-l));
  M->set(1, 1, 2*n/(t-b));
  M->set(2, 1, (t+b)/(t-b));
  M->set(2, 2, -(f+n)/(f-n));
  M->set(3, 2, -2*f*n/(f-n));
  M->set(2, 3, -1);

  return M;
}

bool IRG::isCCW(IVectorPtr v1, IVectorPtr v2, IVectorPtr v3) {
  IVectorPtr a = v1->copy();
  IVectorPtr b = v2->copy();
  IVectorPtr c = v3->copy();

  a->set(2, 1.0);
  b->set(2, 1.0);
  c->set(2, 1.0);

  IVectorPtr ab = a->nVectorProduct(b);
  IVectorPtr bc = b->nVectorProduct(c);
  IVectorPtr ca = c->nVectorProduct(a);

  return ab->scalarProduct(c) >= 0 && bc->scalarProduct(a) >= 0 && ca->scalarProduct(b) >= 0;
}

IVectorPtr IRG::reflect(IVectorPtr u, IVectorPtr n) {
  return u->nSub(n->nScalarMultiply(2.0 * u->scalarProduct(n)))->normalize();
}
