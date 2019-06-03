// Use of heap array after it has been freed

int main(int argc, char **argv) {
  int *array = new int[100];
  delete[] array;
  return array[argc]; // BOOM
}
