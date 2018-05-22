#include "MatrixSubMatrixView.hpp"

MatrixSubMatrixView::MatrixSubMatrixView(IMatrixPtr original, int row, int col)
  : original(original) {

  int rows = original->getRowsCount(), cols = original->getColsCount();

  for (int r = 0; r < rows; r++) {
    if (r != row) {
      rowIndices.push_back(r);
    }
  }

  for (int c = 0; c < cols; c++) {
    if (c != col) {
      colIndices.push_back(c);
    }
  }
}

MatrixSubMatrixView::MatrixSubMatrixView(IMatrixPtr original, std::vector<int> rows, std::vector<int> cols)
  : original(original), rowIndices(rows), colIndices(cols) {
  std::sort(rowIndices.begin(), rowIndices.end());
  std::sort(colIndices.begin(), colIndices.end());
}

MatrixSubMatrixView::~MatrixSubMatrixView() {
}

int MatrixSubMatrixView::getRowsCount() const {
  return rowIndices.size();
}

int MatrixSubMatrixView::getColsCount() const {
  return colIndices.size();
}

double MatrixSubMatrixView::get(int row, int col) const {
  checkIndices(this, row, col);

  return original->get(rowIndices[row], colIndices[col]);
}

IMatrixPtr MatrixSubMatrixView::set(int row, int col, double value) {
  checkIndices(this, row, col);

  return original->set(rowIndices[row], colIndices[col], value);
}

IMatrixPtr MatrixSubMatrixView::copy() const {
  int rows = getRowsCount(), cols = getColsCount();
  IMatrixPtr res(newInstance(rows, cols));

  for (int r = 0; r < rows; r++) {
    for (int c = 0; c < cols; c++) {
      res->set(r, c, get(r, c));
    }
  }

  return res;
}

IMatrixPtr MatrixSubMatrixView::newInstance(int rows, int cols) const {
  return original->newInstance(rows, cols);
}

IMatrixPtr MatrixSubMatrixView::subMatrix(int row, int col, bool liveView) {
  if (liveView) {
    return IMatrixPtr(new MatrixSubMatrixView(std::enable_shared_from_this<IMatrix>::shared_from_this(), row, col));
  } else {
    return MatrixSubMatrixView(std::enable_shared_from_this<IMatrix>::shared_from_this(), row, col).copy();
  }
}
