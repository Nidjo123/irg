#include "MatrixVectorView.hpp"
#include "IVector.hpp"

MatrixVectorView::MatrixVectorView(IVectorPtr vec, bool asRowMatrix)
  : original(vec), asRowMatrix(asRowMatrix) {
}

MatrixVectorView::~MatrixVectorView() {
}

int MatrixVectorView::getRowsCount() const {
  return asRowMatrix ? 1 : original->getDimension();
}

int MatrixVectorView::getColsCount() const {
  return asRowMatrix ? original->getDimension() : 1;
}

double MatrixVectorView::get(int row, int col) const {
  checkIndices(this, row, col);

  return asRowMatrix ? original->get(col) : original->get(row);
}

IMatrixPtr MatrixVectorView::set(int row, int col, double value) {
  checkIndices(this, row, col);

  original->set(asRowMatrix ? col : row, value);

  return std::enable_shared_from_this<IMatrix>::shared_from_this();
}

IMatrixPtr MatrixVectorView::copy() const {
  const int rows = getRowsCount(), cols = getColsCount();
  IMatrixPtr res(newInstance(getRowsCount(), getColsCount()));

  for (int r = 0; r < rows; r++) {
    for (int c = 0; c < cols; c++) {
      res->set(r, c, get(r, c));
    }
  }

  return res;
}

IMatrixPtr MatrixVectorView::newInstance(int rows, int cols) const {
  return IMatrixPtr(new Matrix(rows, cols));
}
