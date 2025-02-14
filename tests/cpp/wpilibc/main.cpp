
#include <cameraserver/CameraServer.h>
#include <frc/TimedRobot.h>

#include <iostream>

class Robot : public frc::TimedRobot {
 public:
  void RobotInit() override { frc::CameraServer::StartAutomaticCapture(); }

  void RobotPeriodic() override { std::cout << "Hello world" << std::endl; }
};

#ifndef RUNNING_FRC_TESTS
int main() { return frc::StartRobot<Robot>(); }
#endif
