#ifndef ABSTRACT_MATRIX_HPP
#define ABSTRACT_MATRIX_HPP

#include <cmath>
#include "IMatrix.hpp"
#include "MathException.hpp"

class AbstractMatrix : public IMatrix {
public:
  AbstractMatrix();
  virtual ~AbstractMatrix();

  virtual IMatrixPtr nTranspose(bool) override;
  virtual IMatrixPtr add(IMatrixPtr) override;
  virtual IMatrixPtr nAdd(IMatrixPtr) const override;
  virtual IMatrixPtr sub(IMatrixPtr) override;
  virtual IMatrixPtr nSub(IMatrixPtr) const override;
  virtual IMatrixPtr nMultiply(IMatrixPtr) const override;
  virtual IMatrixPtr scalarMultiply(double) override;
  virtual double determinant() override;
  virtual IMatrixPtr subMatrix(int, int, bool) override;
  virtual IMatrixPtr nInvert() override;
  virtual IVectorPtr toVector(bool) override;
  virtual std::vector<std::vector<double>> toVec() const override;
  virtual std::string toString() const override;

private:
  virtual IMatrixPtr nAdjugate();

protected:
  static void checkIndices(const IMatrix*, int, int);
  static void checkSizes(const IMatrix*, const IMatrix*);
};

#endif
