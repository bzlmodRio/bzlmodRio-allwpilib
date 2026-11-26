
#include <iostream>

#include "wpi/telemetry/Telemetry.hpp"

int main() {
  wpi::telemetry::Log("value", 42.0);
  std::cout << "Hello World" << std::endl;
  return 0;
}
