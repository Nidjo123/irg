#include "Vector.hpp"
#include <iostream>
#include <cstdlib>

Vector::Vector(int size) : elements(new double[size]), dimension(size), readOnly(false) {
  for (int i = 0; i < size; i++) {
    elements[i] = 0;
  }
}

Vector::Vector(double x, double y, double z)
  : Vector(3) {
  elements[0] = x;
  elements[1] = y;
  elements[2] = z;
}

Vector::Vector(double x, double y, double z, double h)
  : Vector(4) {
  elements[0] = x;
  elements[1] = y;
  elements[2] = z;
  elements[3] = h;
}

Vector::Vector(const Vector& other) : Vector(other.dimension) {
  for (int i = 0; i < dimension; i++) {
    elements[i] = other.elements[i];
  }
}

Vector::Vector(std::vector<double> vec) : Vector(vec.size()) {
  for (int i = 0; i < dimension; i++) {
    elements[i] = vec[i];
  }
}

Vector::Vector(std::initializer_list<double> list) : Vector(list.size()) {
  int i = 0;

  for (double value : list) {
    elements[i++] = value;
  }
}

Vector::~Vector() {
  delete [] elements;
}

double Vector::get(int index) const {
  return elements[index];
}

IVectorPtr Vector::set(int index, double value) {
  elements[index] = value;

  return shared_from_this();
}

int Vector::getDimension() const {
  return dimension;
}

IVectorPtr Vector::copy() const {
  return IVectorPtr(new Vector(*this));
}

IVectorPtr Vector::newInstance(int n) const {
  return IVectorPtr(new Vector(n));
}

IVectorPtr Vector::parseSimple(std::string s) {
  std::istringstream iss(s);
  std::vector<std::string> elems;
  std::string tmp;

  while (iss) {
    iss >> tmp;
    elems.push_back(tmp);
  }

  elems.erase(elems.end() - 1);

  IVectorPtr vec(new Vector(elems.size()));

  for (int i = 0; i < elems.size(); i++) {
    vec->set(i, std::atof(elems[i].c_str()));
  }

  return vec;
}
