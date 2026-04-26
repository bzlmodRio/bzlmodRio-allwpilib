
#include <wpi/nt/NetworkTable.hpp>

#include <iostream>

int main() {
  std::cout << "Hello World" << std::endl;

  // set up instances
  auto server = wpi::nt::CreateInstance();

  wpi::nt::StartServer(server, "bench.json", "127.0.0.1", "", 10000);
  std::cout << "Hello World" << std::endl;

  return 0;
}
