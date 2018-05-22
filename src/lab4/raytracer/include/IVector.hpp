#ifndef IVECTOR_HPP
#define IVECTOR_HPP

#include "predefs.hpp"

class IVector : public std::enable_shared_from_this<IVector> {
public:
  virtual double get(int) const = 0;
  virtual IVectorPtr set(int, double) = 0;
  virtual int getDimension() const = 0;
  virtual IVectorPtr newInstance(int) const = 0;
  virtual IVectorPtr copy() const = 0;
  virtual IVectorPtr copyPart(int) const = 0;
  virtual IVectorPtr add(IVectorPtr) = 0;
  virtual IVectorPtr nAdd(IVectorPtr) const = 0;
  virtual IVectorPtr sub(IVectorPtr) = 0;
  virtual IVectorPtr nSub(IVectorPtr) const = 0;
  virtual IVectorPtr scalarMultiply(double) = 0;
  virtual IVectorPtr nScalarMultiply(double) const = 0;
  virtual double norm() const = 0;
  virtual IVectorPtr normalize() = 0;
  virtual IVectorPtr nNormalize() const = 0;
  virtual IVectorPtr negate() = 0;
  virtual IVectorPtr nNegate() const = 0;
  virtual double cosine(IVectorPtr) const = 0;
  virtual double scalarProduct(IVectorPtr) const = 0;
  virtual IVectorPtr nVectorProduct(IVectorPtr) const = 0;
  virtual IVectorPtr nFromHomogeneous() const = 0;
  virtual IVectorPtr toHomogeneous() const = 0;
  virtual IMatrixPtr toRowMatrix(bool) = 0;
  virtual IMatrixPtr toColumnMatrix(bool) = 0;
  virtual std::vector<double> toVec() const = 0;
  virtual std::string toString() const = 0;
};

#endif











