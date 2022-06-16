#include <iostream>

int main(int argc, char** argv) {
  int num = atoi(argv[1]);  // get the first arg and make it from string -> int

  int factorial = 0;  // Oops !
  for (int i = 1; i <= num; ++i) {
    factorial *= i;
  }
  std::cout << num << "! = " << factorial << "\n";
  return factorial;
}