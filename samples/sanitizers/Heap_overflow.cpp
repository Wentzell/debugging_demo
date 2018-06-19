// Use of std::vector out of bounds -> Heap

#include <vector>

int fun(int n){
  //std::vector<int> vec(100, 1);
  int vec[100]; 
  vec[n + 200] = 500; // Invalid Write
  return vec[n + 100]; // Invalid Read
}

int main(int argc, char **argv) {
  fun(argc); 
}

