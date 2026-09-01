
#include <wpi/hal/HAL.h>

#include <iostream>
#include <string>
#include <wpi/util/json.hpp>
#include <wpi/util/raw_ostream.hpp>

int main() {
  HAL_Initialize(500, 0);
  return 0;
}
