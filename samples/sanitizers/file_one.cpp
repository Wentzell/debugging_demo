#include <iostream>
#include "file_two.hpp"

int main() {
  int num = 0;
  do {
    std::cout << "Enter a positive integer:\n";
    std::cin >> num;
  } while (num < 0);
  
  std::cout << num << "! = " << factorial(num) << std::endl; 

  return 0; 
}
