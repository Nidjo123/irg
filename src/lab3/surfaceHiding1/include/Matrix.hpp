#ifndef MATRIX_HPP
#define MATRIX_HPP

#include "AbstractMatrix.hpp"

class Matrix : public AbstractMatrix {
private:
  double **elements;
  const int rows;
  const int cols;

public:
  Matrix(int, int);
  Matrix(const Matrix&);
  virtual ~Matrix();

  virtual int getRowsCount() const override;
  virtual int getColsCount() const override;
  virtual double get(int, int) const override;
  virtual IMatrixPtr set(int, int, double) override;
  virtual IMatrixPtr copy() const override;
  virtual IMatrixPtr newInstance(int, int) const override;

  static IMatrixPtr parseSimple(std::string);

  friend std::ostream& operator<< (std::ostream&, const IMatrixPtr&);
};

#endif // MATRIX_HPP
