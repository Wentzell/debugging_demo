// Integer overflow

int main(int argc, char **argv) {
  int t = argc << 16;
  return t * t;
}
