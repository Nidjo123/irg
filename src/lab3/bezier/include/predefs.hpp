#ifndef PREDEFS_HPP
#define PREDEFS_HPP

#include <iostream>
#include <iomanip>
#include <cstdlib>
#include <memory>
#include <vector>
#include <string>
#include <algorithm>
#include <cmath>
#include <sstream>
#include <iterator>
#include <initializer_list>
#include "UtilFunctions.hpp"
#include "MathException.hpp"

const double EPS = 1e-7;

class IVector;
typedef std::shared_ptr<IVector> IVectorPtr;

class IMatrix;
typedef std::shared_ptr<IMatrix> IMatrixPtr;

class AbstractVector;
class AbstractMatrix;

class Vector;
class Matrix;

class VectorMatrixView;
class MatrixVectorView;


#endif // PREDEFS_HPP
