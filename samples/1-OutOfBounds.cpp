#include <vector>

int f(int n) {
  std::vector<int> vec(100, 1); // a 1d "array" of 100 int init to 1
  vec[n + 50] = 500;            // Invalid Write
  return vec[n + 50];           // Invalid Read
}

// -------

#include <iostream>
int main(int argc, char **argv) {
  if (argc < 2) return 0; // no arguments : do nothing
  int n = atoi(argv[1]);  // get the first arg and make it from string -> int
  int result = f(n);
  std::cout << result << std::endl;
}

