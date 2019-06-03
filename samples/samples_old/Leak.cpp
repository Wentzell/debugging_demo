// Memory leak

int main() {
  int *g = new int;
  g = nullptr; // Lost the pointer.
}
