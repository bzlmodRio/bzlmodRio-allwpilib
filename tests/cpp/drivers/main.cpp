
#include <iostream>

#include "wpi/drivers/odometry/GoBildaPinpoint.hpp"
#include "wpi/hal/HAL.h"

int main() {
  HAL_Initialize();
  wpi::GoBildaPinpoint pinpoint{wpi::I2C::Port::PORT_0};
  std::cout << "Hello World" << std::endl;
  return 0;
}
