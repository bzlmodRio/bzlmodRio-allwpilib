
#include <wpi/json.h>
#include <wpi/raw_ostream.h>

#include <iostream>
#include <string>

int main() {
  wpi::json xxx = "{}"_json;
  std::string output;
  wpi::raw_string_ostream stream(output);
  xxx.dump(stream);
  std::cout << "Hello World" << std::endl;
  // std::cout << xxx << std::endl;
  return 0;
}
