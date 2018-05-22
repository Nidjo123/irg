#include <iostream>
#include <string>
#include <boost/algorithm/string.hpp>

using namespace boost::algorithm;

int main() {
  std::string s = "Boost C++ Library";
  std::cout << to_upper_copy(s) << std::endl;

  return 0;
}
