#include "Matrix.hpp"

Matrix::Matrix(int rows, int cols) : rows(rows), cols(cols), elements(new double*[rows]) {
  for (int r = 0; r < rows; r++) {
    elements[r] = new double[cols];
    for (int c = 0; c < cols; c++) {
      elements[r][c] = 0;
    }
  }
}

Matrix::Matrix(const Matrix& other) : Matrix(other.rows, other.cols) {
  for (int r = 0; r < rows; r++) {
    for (int c = 0; c < cols; c++) {
      elements[r][c] = other.elements[r][c];
    }
  }
}

Matrix::~Matrix() {
  for (int r = 0; r < rows; r++) {
    delete [] elements[r];
  }

  delete [] elements;
}

int Matrix::getRowsCount() const {
  return rows;
}

int Matrix::getColsCount() const {
  return cols;
}

double Matrix::get(int row, int col) const {
  checkIndices(this, row, col);

  return elements[row][col];
}

IMatrixPtr Matrix::set(int row, int col, double value) {
  checkIndices(this, row, col);

  elements[row][col] = value;

  return std::enable_shared_from_this<IMatrix>::shared_from_this();
}

IMatrixPtr Matrix::copy() const {
  return IMatrixPtr(new Matrix(*this));
}

IMatrixPtr Matrix::newInstance(int rows, int cols) const {
  return IMatrixPtr(new Matrix(rows, cols));
}

IMatrixPtr Matrix::parseSimple(std::string s) {
  std::vector<std::string> rows = split_string(s, '|');

  int r = 0, c = 0;
  IMatrixPtr res;

  for (std::string row : rows) {
    std::vector<std::string> cols = split_string(row, ' ');

    if (res == nullptr) {
      res.reset(new Matrix(rows.size(), cols.size()));
    }

    c = 0;
    for (std::string col : cols) {
      res->set(r, c, std::atof(col.c_str()));
      c++;
    }
    r++;
  }

  return IMatrixPtr(res);
}
