#include <iostream>

int factorial(int n) {
  int fact;
  for (int i = 1; i <= n; ++i) {
    fact *= i;
  }
  return fact;
}
