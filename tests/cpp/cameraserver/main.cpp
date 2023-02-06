
#include <cameraserver/CameraServer.h>

#include <iostream>

int main() {
  std::cout << "Hello World" << std::endl;

  frc::CameraServer::StartAutomaticCapture();
  return 0;
}
