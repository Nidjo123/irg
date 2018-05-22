#include "AbstractVector.hpp"
#include "MatrixVectorView.hpp"

IVectorPtr AbstractVector::add(IVectorPtr other) {
  checkDimensions(this, other.get());

  for (int i = 0; i < getDimension(); i++) {
    set(i, get(i) + other->get(i));
  }

  return std::enable_shared_from_this<IVector>::shared_from_this();
}

IVectorPtr AbstractVector::nAdd(IVectorPtr other) const {
  return copy()->add(other);
}

IVectorPtr AbstractVector::sub(IVectorPtr other) {
  checkDimensions(this, other.get());

  for (int i = 0; i < getDimension(); i++) {
    set(i, get(i) - other->get(i));
  }

  return shared_from_this();
}

IVectorPtr AbstractVector::nSub(IVectorPtr other) const {
  return copy()->sub(other);
}

IVectorPtr AbstractVector::scalarMultiply(double k) {
  for (int i = 0; i < getDimension(); i++) {
    set(i, k * get(i));
  }

  return shared_from_this();
}

IVectorPtr AbstractVector::nScalarMultiply(double k) const {
  return copy()->scalarMultiply(k);
}

double AbstractVector::norm() const {
  double sum = 0., x;

  for (int i = 0; i < getDimension(); i++) {
    x = get(i);
    sum += x * x;
  }

  return std::sqrt(sum);
}

IVectorPtr AbstractVector::normalize() {
  scalarMultiply(1.0 / norm());

  return shared_from_this();
}

IVectorPtr AbstractVector::nNormalize() const {
  return copy()->normalize();
}

IVectorPtr AbstractVector::negate() {
  for (int i = 0; i < getDimension(); i++) {
    set(i, -get(i));
  }

  return shared_from_this();
}

IVectorPtr AbstractVector::nNegate() const {
  return copy()->negate();
}

double AbstractVector::cosine(IVectorPtr other) const {
  return scalarProduct(other) / (norm() * other->norm());
}

double AbstractVector::scalarProduct(IVectorPtr other) const {
  checkDimensions(this, other.get());

  double res = 0.;

  for (int i = 0; i < getDimension(); i++) {
    res += get(i) * other->get(i);
  }

  return res;
}

IVectorPtr AbstractVector::nVectorProduct(IVectorPtr other) const {
  if (getDimension() != 3) {
    throw IncompatibleOperandException();
  }

  checkDimensions(this, other.get());

  IVectorPtr res(newInstance(3));

  std::vector<double> v1 = this->toVec();
  std::vector<double> v2 = other->toVec();

  res->set(0, v1[1]*v2[2] - v1[2]*v2[1]);
  res->set(1, v1[2]*v2[0] - v1[0]*v2[2]);
  res->set(2, v1[0]*v2[1] - v1[1]*v2[0]);

  return res;
}

IVectorPtr AbstractVector::nFromHomogeneous() const {
  int dimension = getDimension();
  double hom = get(dimension - 1);

  if (std::abs(hom - 0.) < EPS) {
    throw InvalidOperationException("Homogenous coordinate is zero!");
  }

  return copyPart(dimension - 1)->scalarMultiply(1 / hom);
}

IVectorPtr AbstractVector::toHomogeneous() const {
  int dimension = getDimension();
  IVectorPtr res = copyPart(dimension + 1);
  res->set(dimension, 1.0);

  return res;
}

IMatrixPtr AbstractVector::toRowMatrix(bool liveView) {
  if (liveView) {
    return IMatrixPtr(new MatrixVectorView(shared_from_this(), true));
  } else {
    const int dim = getDimension();
    IMatrixPtr mat(new Matrix(1, dim));

    for (int i = 0; i < dim; i++) {
      mat->set(0, i, get(i));
    }

    return mat;
  }
}

IMatrixPtr AbstractVector::toColumnMatrix(bool liveView) {
  if (liveView) {
    return IMatrixPtr(new MatrixVectorView(shared_from_this(), false));
  } else {
    const int dim = getDimension();
    IMatrixPtr mat(new Matrix(dim, 1));

    for (int i = 0; i < dim; i++) {
      mat->set(i, 0, get(i));
    }

    return mat;
  }
}

IVectorPtr AbstractVector::copyPart(int n) const {
  IVectorPtr res(newInstance(n));

  int dimension = getDimension();

  for (int i = 0; i < std::min(dimension, n); i++) {
    res->set(i, get(i));
  }

  for (int i = dimension; i < n; i++) {
    res->set(i, 0);
  }

  return res;
}

std::vector<double> AbstractVector::toVec() const {
  std::vector<double> res(getDimension());

  for (int i = 0; i < getDimension(); i++) {
    res[i] = get(i);
  }

  return res;
}

std::string AbstractVector::toString() const {
  std::ostringstream stream;

  stream << "[";

  for (int i = 0; i < getDimension(); i++) {
    stream << std::setw(8) << get(i) << " ";
  }

  stream << std::setw(3) << "]";

  return stream.str();
}

void AbstractVector::checkIndex(const IVector *v, int index) {
  if (index < 0 || index >= v->getDimension()) {
    throw InvalidIndexException("Invalid vector component index!");
  }
}

void AbstractVector::checkDimensions(const IVector *v1, const IVector *v2) {
  if (v1->getDimension() != v2->getDimension()) {
    throw IncompatibleOperandException();
  }
}

