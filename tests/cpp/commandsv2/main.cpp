
#include <wpi/cameraserver/CameraServer.hpp>
#include <wpi/framework/TimedRobot.hpp>
#include <wpi/commands2/Command.hpp>
#include <wpi/commands2/CommandHelper.hpp>
#include <wpi/commands2/Subsystem.hpp>

#include <iostream>

class ExampleSubsystem : public wpi::cmd::Subsystem {
  void Periodic() override { std::cout << "Subsystem periodic" << std::endl; }
};

class ExampleCommand
    : public wpi::cmd::CommandHelper<wpi::cmd::Command, ExampleCommand> {
 public:
  explicit ExampleCommand(ExampleSubsystem& sub) { AddRequirements(&sub); }

  void Execute() override { std::cout << "Command periodic" << std::endl; }
};

class Robot : public wpi::TimedRobot {
 public:
  ExampleSubsystem m_subsystem;

  Robot() {
    wpi::CameraServer::StartAutomaticCapture();

    m_subsystem.SetDefaultCommand(ExampleCommand{m_subsystem});
  }
  void RobotPeriodic() override { std::cout << "RobotPeriodic" << std::endl; }
};

#ifndef RUNNING_FRC_TESTS
int main() { return wpi::StartRobot<Robot>(); }
#endif
