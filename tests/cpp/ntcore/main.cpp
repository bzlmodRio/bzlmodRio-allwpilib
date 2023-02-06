
#include <networktables/NetworkTable.h>

#include <iostream>

int main() {
  std::cout << "Hello World" << std::endl;

  // set up instances
  auto server = nt::CreateInstance();

  nt::StartServer(server, "bench.json", "127.0.0.1", 10000, 10001);
  std::cout << "Hello World" << std::endl;

  return 0;
}
