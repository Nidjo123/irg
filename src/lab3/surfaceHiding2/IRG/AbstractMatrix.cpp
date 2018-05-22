#include "AbstractMatrix.hpp"
#include "MatrixTransposeView.hpp"
#include "MatrixSubMatrixView.hpp"
#include "VectorMatrixView.hpp"

AbstractMatrix::AbstractMatrix() {}

AbstractMatrix::~AbstractMatrix() {}

IMatrixPtr AbstractMatrix::nTranspose(bool liveView) {
  if (liveView)  {
      return IMatrixPtr(new MatrixTransposeView(std::enable_shared_from_this<IMatrix>::shared_from_this()));
  } else {
    int rows = getRowsCount(), cols = getColsCount();
    IMatrixPtr res(this->newInstance(cols, rows));

    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        res->set(c, r, get(r, c));
      }
    }

    return res;
  }
}

IMatrixPtr AbstractMatrix::add(IMatrixPtr mat) {
  checkSizes(this, mat.get());

  int rows = getRowsCount(), cols = getColsCount();

  for (int r = 0; r < rows; r++) {
    for (int c = 0; c < cols; c++) {
      set(r, c, get(r, c) + mat->get(r, c));
    }
  }

  return std::enable_shared_from_this<IMatrix>::shared_from_this();
}

IMatrixPtr AbstractMatrix::nAdd(IMatrixPtr mat) const {
  return copy()->add(mat);
}

IMatrixPtr AbstractMatrix::sub(IMatrixPtr mat) {
  checkSizes(this, mat.get());

  int rows = getRowsCount(), cols = getColsCount();

  for (int r = 0; r < rows; r++) {
    for (int c = 0; c < cols; c++) {
      set(r, c, get(r, c) - mat->get(r, c));
    }
  }

  return std::enable_shared_from_this<IMatrix>::shared_from_this();
}

IMatrixPtr AbstractMatrix::nSub(IMatrixPtr mat) const {
  return copy()->sub(mat);
}

IMatrixPtr AbstractMatrix::nMultiply(IMatrixPtr mat) const {
  const int rows = getRowsCount(), cols = mat->getColsCount();
  const int cCols = getColsCount();

  if (getColsCount() != mat->getRowsCount()) {
    throw IncompatibleOperandException();
  }

  IMatrixPtr res(newInstance(rows, cols));

  for (int r = 0; r < rows; r++) {
    for (int c = 0; c < cols; c++) {

      double prod = 0.;
      for (int k = 0; k < cCols; k++) {
        prod += get(r, k) * mat->get(k, c);
      }

      res->set(r, c, prod);
    }
  }

  return res;
}

IMatrixPtr AbstractMatrix::subMatrix(int row, int col, bool liveView) {
  if (liveView) {
    return IMatrixPtr(new MatrixSubMatrixView(std::enable_shared_from_this<IMatrix>::shared_from_this(), row, col));
  } else {
    return MatrixSubMatrixView(std::enable_shared_from_this<IMatrix>::shared_from_this(), row, col).copy();
  }
}

double AbstractMatrix::determinant() {
    const int rows = getRowsCount(), cols = getColsCount();

    if (rows == 1 && cols == 1) {
      return get(0, 0);
    }

    double res = 0.;

    for (int i = 0; i < cols; i++) {
      double tmp = get(0, i) * subMatrix(0, i, true)->determinant();

      res += ((i & 1) ? -1 : +1) * tmp;
    }

    return res;
}

IMatrixPtr AbstractMatrix::scalarMultiply(double k) {
  for (int r = 0; r < getRowsCount(); r++) {
    for (int c = 0; c < getColsCount(); c++) {
      set(r, c, k * get(r, c));
    }
  }

  return std::enable_shared_from_this<IMatrix>::shared_from_this();
}

IMatrixPtr AbstractMatrix::nInvert() {
  const double det = determinant();

  if (std::abs(det - 0.) < EPS) {
    throw InvalidOperationException("Can't find inverse because determinant is zero!");
  }

  return nAdjugate()->scalarMultiply(1 / det);
}

IMatrixPtr AbstractMatrix::nAdjugate() {
  const int mRows = getRowsCount(), mCols = getColsCount();
  IMatrixPtr mT(nTranspose(true));
  IMatrixPtr adj(newInstance(mCols, mRows));

  for (int r = 0; r < mCols; r++) {
    int sign = (r & 1) ? -1 : +1;
    for (int c = 0; c < mRows; c++) {
      adj->set(r, c, sign * mT->subMatrix(r, c, true)->determinant());

      sign *= -1;
    }
  }

  return adj;
}

std::vector<std::vector<double>> AbstractMatrix::toVec() const {
  std::vector<std::vector<double>> res(getRowsCount());

  for (int r = 0; r < getRowsCount(); r++) {
    for (int c = 0; c < getColsCount(); c++) {
      res[r].push_back(get(r, c));
    }
  }

  return res;
}

IVectorPtr AbstractMatrix::toVector(bool liveView) {
  if (liveView) {
    return IVectorPtr(new VectorMatrixView(shared_from_this()));
  } else {
    return VectorMatrixView(shared_from_this()).copy();
  }
}

std::string AbstractMatrix::toString() const {
  std::ostringstream stream;
  const int rows = getRowsCount(), cols = getColsCount();

  for (int r = 0; r < rows; r++) {
    stream << "[";

    for (int c = 0; c < cols; c++) {
      stream << std::setw(4) << get(r, c);
    }

    stream << std::setw(4) << "]" << "\n";
  }

  return stream.str();
}

void AbstractMatrix::checkIndices(const IMatrix* mat, int r, int c) {
  if (r < 0 || c < 0 || r >= mat->getRowsCount() || c >= mat->getColsCount()) {
    throw InvalidIndexException();
  }
}

void AbstractMatrix::checkSizes(const IMatrix *m1, const IMatrix *m2) {
  if (m1->getRowsCount() != m2->getRowsCount() || m1->getColsCount() != m2->getColsCount()) {
    throw IncompatibleOperandException();
  }
}
