#pragma once

#include <wpi/driverstation/Joystick.hpp>
#include <wpi/framework/TimedRobot.hpp>

#include "robot-cpp/subsystems/drivetrain.hpp"
#include "robot-cpp/subsystems/elevator.hpp"
#include "robot-cpp/subsystems/shooter.hpp"

class Robot : public wpi::TimedRobot {
 public:
  Robot();
  void RobotPeriodic() override;

 private:
  wpi::Joystick m_joystick{0};

  Elevator m_elevator;
  DriveTrain m_drivetrain;
  Shooter m_shooter;
};
