#include <iostream>
#include "file_two.hpp"

int main(int argc, char* argv[]) {

  int num = atoi(argv[1]);
  std::cout << num << "! = " << factorial(num) << std::endl;
  return 0; 
}
