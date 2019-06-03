#include <iostream>

int main(int argc, char* argv[]) {

  int num = atoi(argv[1]);
  
  int factorial; 
  for (int i = 1; i <= num; ++i) {
    factorial *= i; 
  }

  std::cout << num << "! = " << factorial << "\n"; 
  //return factorial; 
}
