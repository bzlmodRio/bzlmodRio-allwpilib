
#include <cameraserver/CameraServer.h>
#include <frc/TimedRobot.h>
#include <frc2/command/Command.h>
#include <frc2/command/CommandHelper.h>
#include <frc2/command/Subsystem.h>

#include <iostream>

class ExampleSubsystem : public frc2::Subsystem {
  void Periodic() override { std::cout << "Subsystem periodic" << std::endl; }
};

class ExampleCommand
    : public frc2::CommandHelper<frc2::Command, ExampleCommand> {
 public:
  explicit ExampleCommand(ExampleSubsystem &sub) { AddRequirements(&sub); }

  void Execute() override { std::cout << "Command periodic" << std::endl; }
};

class Robot : public frc::TimedRobot {
 public:
  ExampleSubsystem m_subsystem;

  void RobotInit() override {
    frc::CameraServer::StartAutomaticCapture();

    m_subsystem.SetDefaultCommand(ExampleCommand{m_subsystem});
  }
  void RobotPeriodic() override { std::cout << "RobotPeriodic" << std::endl; }
};

#ifndef RUNNING_FRC_TESTS
int main() { return frc::StartRobot<Robot>(); }
#endif
