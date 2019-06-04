int main() {
  int *g = new int[100];  // allocate the array of 100 int on the heap
  g = nullptr;		  // Lost the pointer.

  // ... whatever ...
}

