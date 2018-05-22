#ifndef MATRIX_TRANSPOSE_VIEW_HPP
#define MATRIX_TRANSPOSE_VIEW_HPP

#include "IMatrix.hpp"
#include "AbstractMatrix.hpp"

class MatrixTransposeView : public AbstractMatrix {
private:
  IMatrixPtr original;
  bool liveView;

public:
  MatrixTransposeView(IMatrixPtr);

  virtual int getRowsCount() const;
  virtual int getColsCount() const;
  virtual double get(int, int) const;
  virtual IMatrixPtr set(int, int, double);
  virtual IMatrixPtr copy() const;
  virtual IMatrixPtr newInstance(int, int) const;
  virtual std::vector<std::vector<double>> toVec() const;
};

#endif
