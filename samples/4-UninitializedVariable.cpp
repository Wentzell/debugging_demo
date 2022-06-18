#include <iostream>

int main(int argc, char** argv) {
  int num = atoi(argv[1]);  // get the first arg and convert it to int

  int factorial;  // Oops !
  for (int i = 1; i <= num; ++i) {
    factorial *= i;
  }
  std::cout << num << "! = " << factorial << "\n";
  return factorial;
}

