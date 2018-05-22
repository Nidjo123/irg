#ifndef VECTOR_HPP
#define VECTOR_HPP

#include "AbstractVector.hpp"


class Vector : public AbstractVector {
private:
  double* elements;
  int dimension;
  bool readOnly;

public:
  Vector(int);
  Vector(double, double, double);
  Vector(double, double, double, double);
  Vector(std::vector<double>);
  Vector(const Vector&);
  Vector(std::initializer_list<double>);

  virtual ~Vector();

  virtual double get(int) const override;
  virtual IVectorPtr set(int, double) override;
  virtual int getDimension() const override;
  virtual IVectorPtr copy() const override;
  virtual IVectorPtr newInstance(int) const override;

  static IVectorPtr parseSimple(std::string);

  friend std::ostream& operator<< (std::ostream&, const IVectorPtr&);
};

#endif
