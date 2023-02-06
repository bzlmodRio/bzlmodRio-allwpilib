
#include <cscore.h>

#include <iostream>

int main() {
  std::cout << "Hello World" << std::endl;

  auto source = cs::HttpCamera("axis", "http://localhost:8000");
  std::cout << &source << std::endl;
  cs::Shutdown();
  std::cout << "Hello World" << std::endl;

  return 0;
}
