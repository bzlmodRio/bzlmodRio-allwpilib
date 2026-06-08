
#include <iostream>
#include <wpi/cs/HttpCamera.hpp>

int main() {
  std::cout << "Hello World" << std::endl;

  auto source = wpi::cs::HttpCamera("axis", "http://localhost:8000");
  std::cout << &source << std::endl;
  wpi::cs::Shutdown();
  std::cout << "Hello World" << std::endl;

  return 0;
}
