#ifndef VECTOR_MATRIX_VIEW_HPP
#define VECTOR_MATRIX_VIEW_HPP

#include "AbstractVector.hpp"

class VectorMatrixView : public AbstractVector {
private:
  IMatrixPtr original;
  int dimension;
  bool rowMatrix;

public:
  VectorMatrixView(IMatrixPtr);
  virtual ~VectorMatrixView();

  virtual double get(int) const override;
  virtual IVectorPtr set(int, double) override;
  virtual int getDimension() const override;
  virtual IVectorPtr copy() const override;
  virtual IVectorPtr newInstance(int) const override;
};

#endif // VECTOR_MATRIX_VIEW_HPP
