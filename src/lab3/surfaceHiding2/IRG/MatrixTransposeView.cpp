#include "MatrixTransposeView.hpp"

MatrixTransposeView::MatrixTransposeView(IMatrixPtr original)
  : original(original) {

}

int MatrixTransposeView::getRowsCount() const {
  return original->getColsCount();
}

int MatrixTransposeView::getColsCount() const {
  return original->getRowsCount();
}

double MatrixTransposeView::get(int r, int c) const {
  checkIndices(this, r, c);

  return original->get(c, r);
}

IMatrixPtr MatrixTransposeView::set(int i, int j, double value) {
  checkIndices(this, i, j);

  return original->set(j, i, value);
}

IMatrixPtr MatrixTransposeView::copy() const {
  const int rows = getRowsCount(), cols = getColsCount();
  IMatrixPtr res(newInstance(rows, cols));

  for (int r = 0; r < rows; r++) {
    for (int c = 0; c < cols; c++) {
      res->set(r, c, get(r, c));
    }
  }

  return res;
}

IMatrixPtr MatrixTransposeView::newInstance(int rows, int cols) const {
  return original->newInstance(rows, cols);
}

std::vector<std::vector<double>> MatrixTransposeView::toVec() const {
  int rows = getRowsCount(), cols = getColsCount();
  std::vector<std::vector<double>> res(rows);

  for (int r = 0; r < rows; r++) {
    for (int c = 0; c < cols; c++) {
      res[r].push_back(get(r, c));
    }
  }

  return res;
}
