#include <iostream>
#include <sstream>
#include <stdexcept>
#include <boost/algorithm/string.hpp>
#include "ObjectModel.h"

int main(int argc, char *argv[]) {
  std::string file;
  if (argc != 2) {
    std::cout << "Upisite put do .obj datoteke: ";
    std::cin >> file;
  } else {
    file = argv[1];
  }

  std::cout << "Reading file " << file << std::endl;

  ObjectModel model;

  try {
    model = ObjectModel(file);
  } catch(const std::exception& e) {
    std::cout << e.what() << std::endl;
    return 1;
  }

  bool done = false;
  std::string input;
  
  while (!done) {
    std::getline(std::cin, input);
    boost::trim(input);

    if (boost::iequals(input, "quit")) {
      done = true;
    } else if (boost::iequals(input, "normiraj")) {
      model.normalize();
      std::cout << model.dumpToOBJ() << std::endl;
    } else if (boost::iequals(input, "print")) {
      std::cout << model.dumpToOBJ() << std::endl;
    } else {
      // 3D point
      std::istringstream iss(input);
      float x, y, z;
      
      iss >> x >> y >> z;

      int pointPos = model.testPoint(x, y, z);
      
      std::cout << "Tocka (" << x << ", " << y << ", " << z << ") ";
      if (pointPos < 0) {
	std::cout << "je unutar objekta." << std::endl;
      } else if (pointPos > 0) {
	std::cout << "nije unutar objekta." << std::endl;
      } else {
	std::cout << "je na obodu objekta." << std::endl;
      }
    }
  }
  
  return 0;
}
