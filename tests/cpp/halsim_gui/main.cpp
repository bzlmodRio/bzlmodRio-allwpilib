
#include <wpi/hal/HAL.h>

#include <iostream>
#include <string>
#include <wpi/util/json.hpp>
#include <wpi/util/raw_ostream.hpp>

int main() {
  wpi::util::json xxx = "{}"_json;
  std::string output;
  wpi::util::raw_string_ostream stream(output);
  xxx.dump(stream);
  std::cout << "Hello World" << std::endl;
  std::cout << output << std::endl;
  HAL_Initialize(500, 0);
  std::cout << output << std::endl;
  return 0;
}
