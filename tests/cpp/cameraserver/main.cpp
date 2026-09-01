
#include <iostream>
#include <wpi/cameraserver/CameraServer.hpp>

int main() {
  std::cout << "Hello World" << std::endl;

  wpi::CameraServer::StartAutomaticCapture();
  return 0;
}
