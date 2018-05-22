#ifndef MATH_EXCEPTION_HPP
#define MATH_EXCEPTION_HPP

#include <stdexcept>
#include "predefs.hpp"

class IncompatibleOperandException : public std::runtime_error {
public:
  IncompatibleOperandException() : std::runtime_error::runtime_error("Incompatible operand!") {}
  IncompatibleOperandException(std::string msg) : std::runtime_error::runtime_error(msg) {}
};

class InvalidIndexException : public std::runtime_error {
public:
  InvalidIndexException() : std::runtime_error::runtime_error("Invalid row or column index!") {}
  InvalidIndexException(std::string msg) : std::runtime_error::runtime_error(msg) {}
};

class InvalidOperationException : public std::runtime_error {
public:
  InvalidOperationException() : std::runtime_error::runtime_error("Invalid operation!") {}
  InvalidOperationException(std::string msg) : std::runtime_error::runtime_error(msg) {}
};
#endif
