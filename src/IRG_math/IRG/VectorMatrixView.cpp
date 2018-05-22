#include "VectorMatrixView.hpp"
#include "IMatrix.hpp"
#include "Vector.hpp"

VectorMatrixView::VectorMatrixView(IMatrixPtr mat) : original(mat), rowMatrix(mat->getRowsCount() == 1) {
  const int rows = mat->getRowsCount(), cols = mat->getColsCount();

  if (rows != 1 && cols != 1) {
    throw InvalidOperationException("At least one dimension of matrix has to be 1!");
  }

  dimension = rowMatrix ? cols : rows;
}

VectorMatrixView::~VectorMatrixView() {
}

double VectorMatrixView::get(int i) const {
  checkIndex(this, i);

  return rowMatrix ? original->get(0, i) : original->get(i, 0);
}

IVectorPtr VectorMatrixView::set(int i, double value) {
  checkIndex(this, i);

  if (rowMatrix) {
    original->set(0, i, value);
  } else {
    original->set(i, 0, value);
  }

  return shared_from_this();
}

int VectorMatrixView::getDimension() const {
  return rowMatrix ? original->getColsCount() : original->getRowsCount();
}

IVectorPtr VectorMatrixView::copy() const {
  const int dim = getDimension();
  IVectorPtr vec(new Vector(dim));

  for (int i = 0; i < dim; i++) {
    vec->set(i, get(i));
  }

  return vec;
}

IVectorPtr VectorMatrixView::newInstance(int size) const {
  return IVectorPtr(new Vector(size));
}
