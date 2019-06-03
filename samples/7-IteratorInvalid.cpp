#include <iostream>
#include <vector>

int main() {
  std::vector<int> v(10, 3);     // 10 numbers init to 3
  auto p = v.begin();		 // an iterator on the beginning of the vector
  std::cout << *p << std::endl;  // print the first value : should be 3
  v.push_back(7);		 // Add one more number to the vector,
  std::cout << *p << std::endl;  // print again the first value ???
}
