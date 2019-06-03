#include <iostream>
#include <vector>

std::vector<int> vec;

int factorial(int n) {
  vec.push_back(n);
  return (n == 0) ? 1 : (n * factorial(n + 1)); // Infinite recursion
}

int main() { std::cout << factorial(10) << "\n"; }
