
#include <hal/DriverStation.h>
#include <hal/HAL.h>

#include <iostream>

int main() {
  std::cout << "Hello World" << std::endl;
  std::cout << HAL_GetRuntimeType() << std::endl;
  // std::cout << xxx << std::endl;
  return 0;
}
