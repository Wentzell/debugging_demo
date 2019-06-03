// Impossible large shift of int 

int main(int argc, char **argv) { 
  return (1 << (32 * argc)) == 0; 
}
