#ifndef MATRIX_SUB_MATRIX_VIEW_HPP
#define MATRIX_SUB_MATRIX_VIEW_HPP

#include "IMatrix.hpp"
#include "AbstractMatrix.hpp"

class MatrixSubMatrixView : public AbstractMatrix {
private:
  IMatrixPtr original;
  std::vector<int> rowIndices;
  std::vector<int> colIndices;

public:
  MatrixSubMatrixView(IMatrixPtr, int, int);
  MatrixSubMatrixView(IMatrixPtr, std::vector<int>, std::vector<int>);
  virtual ~MatrixSubMatrixView();

  virtual int getRowsCount() const;
  virtual int getColsCount() const;
  virtual double get(int, int) const;
  virtual IMatrixPtr set(int, int, double);
  virtual IMatrixPtr copy() const;
  virtual IMatrixPtr newInstance(int, int) const;
  virtual IMatrixPtr subMatrix(int, int, bool);
};

#endif
