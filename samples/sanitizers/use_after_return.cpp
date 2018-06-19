// Use stack variable after scope

int *g;

void LeakLocal() {
  int local;
  g = &local
}

int main() {
  LeakLocal();
  return *g;
}
