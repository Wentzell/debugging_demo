#include <iostream>
int main(int argc, char** argv) {
  int num = atoi(argv[1]);  // get the first arg and convert it to int

  int t = num << 16;
  int r = t * t;
  std::cout << r << std::endl;

  double x = 1/0.0;
  std::cout << x << std::endl;
}
