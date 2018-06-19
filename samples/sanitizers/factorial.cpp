#include <iostream>

int main() {
  int num = 0;
  do {
    std::cout << "Enter a positive integer:\n";
    std::cin >> num;
  } while (num < 0);
  
  int factorial; 
  for (int i = 1; i <= num; ++i) {
    factorial *= i; 
  }

  std::cout << num << "! = " << factorial << "\n"; 

  //return factorial; 
}
