#ifndef MATRIX_VECTOR_VIEW_HPP
#define MATRIX_VECTOR_VIEW_HPP

#include "AbstractMatrix.hpp"
#include "Matrix.hpp"

class MatrixVectorView : public AbstractMatrix {
private:
  IVectorPtr original;
  bool asRowMatrix;

public:
  MatrixVectorView(IVectorPtr, bool);
  virtual ~MatrixVectorView();

  virtual int getRowsCount() const;
  virtual int getColsCount() const;
  virtual double get(int, int) const;
  virtual IMatrixPtr set(int, int, double);
  virtual IMatrixPtr copy() const;
  virtual IMatrixPtr newInstance(int, int) const;
};

#endif // MATRIX_VECTOR_VIEW_HPP
