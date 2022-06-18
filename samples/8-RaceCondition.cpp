#include <omp.h>
#include <iostream>
#include <vector>

int main(int argc, char* argv[]) {
  std::vector<double> data(10000, 1.0);
  double sum;

  #pragma omp parallel
  {
    sum = 0.0;
    #pragma omp for
    for(int i = 0; i < data.size(); i++){
      sum += data[i];
    }
  }
  std::cout << sum << std::endl;
}
