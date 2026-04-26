
#include <wpi/util/json.hpp>
#include <wpi/util/raw_ostream.hpp>

#include <iostream>
#include <string>

int main() {
  wpi::util::json xxx = "{}"_json;
  std::string output;
  wpi::util::raw_string_ostream stream(output);
  xxx.dump(stream);
  std::cout << "Hello World" << std::endl;
  // std::cout << xxx << std::endl;
  return 0;
}
