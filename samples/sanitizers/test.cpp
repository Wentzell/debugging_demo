#include<iostream>
#include<vector>

int main(){
   std::vector<int> v; 
   for (int & itr : v){
      std::cout << itr << std::endl; 
   }
}
