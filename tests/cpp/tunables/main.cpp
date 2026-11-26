
#include <iostream>

#include "wpi/tunables/Tunable.hpp"
#include "wpi/tunables/Tunables.hpp"

int main() {
  wpi::tunables::Tunable<double> value{1.0};
  wpi::tunables::Publish("value", value);
  std::cout << "Value: " << static_cast<double>(value) << std::endl;
  return 0;
}
