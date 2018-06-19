// Read of unitialized memory

int main(int argc, char **argv) {
  int x[10];
  x[0] = 1;
  return x[argc];
}
