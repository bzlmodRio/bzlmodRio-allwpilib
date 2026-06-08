
#include <iostream>
#include <wpi/cameraserver/CameraServer.hpp>
#include <wpi/framework/TimedRobot.hpp>

class Robot : public wpi::TimedRobot {
 public:
  Robot() { wpi::CameraServer::StartAutomaticCapture(); }

  void RobotPeriodic() override { std::cout << "Hello world" << std::endl; }
};

#ifndef RUNNING_FRC_TESTS
int main() { return wpi::StartRobot<Robot>(); }
#endif
