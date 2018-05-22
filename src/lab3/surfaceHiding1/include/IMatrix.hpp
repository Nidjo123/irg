#ifndef IMATRIX_HPP
#define IMATRIX_HPP

#include <vector>
#include "predefs.hpp"

class IMatrix : public std::enable_shared_from_this<IMatrix> {
public:
  virtual int getRowsCount() const = 0;
  virtual int getColsCount() const = 0;
  virtual double get(int, int) const = 0;
  virtual IMatrixPtr set(int, int, double) = 0;
  virtual IMatrixPtr copy() const = 0;
  virtual IMatrixPtr newInstance(int, int) const = 0;
  virtual IMatrixPtr nTranspose(bool) = 0;
  virtual IMatrixPtr add(IMatrixPtr) = 0;
  virtual IMatrixPtr nAdd(IMatrixPtr) const = 0;
  virtual IMatrixPtr sub(IMatrixPtr) = 0;
  virtual IMatrixPtr nSub(IMatrixPtr) const = 0;
  virtual IMatrixPtr nMultiply(IMatrixPtr) const = 0;
  virtual IMatrixPtr scalarMultiply(double) = 0;
  virtual double determinant() = 0;
  virtual IMatrixPtr subMatrix(int, int, bool) = 0;
  virtual IMatrixPtr nInvert() = 0;
  virtual IVectorPtr toVector(bool) = 0;
  virtual std::vector<std::vector<double>> toVec() const = 0;
  virtual std::string toString() const = 0;
};

#endif
