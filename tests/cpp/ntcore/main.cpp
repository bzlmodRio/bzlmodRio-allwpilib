
#include <iostream>
#include <wpi/nt/NetworkTable.hpp>

int main() {
  std::cout << "Hello World" << std::endl;

  // set up instances
  auto server = wpi::nt::CreateInstance();

  wpi::nt::StartServer(server, "bench.json", "127.0.0.1", "", 10001);
  std::cout << "Hello World" << std::endl;

  return 0;
}
