
#include <wpi/cameraserver/CameraServer.hpp>

#include <iostream>

int main() {
  std::cout << "Hello World" << std::endl;

  wpi::CameraServer::StartAutomaticCapture();
  return 0;
}
