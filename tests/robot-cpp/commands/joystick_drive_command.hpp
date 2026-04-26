#pragma once

#include <wpi/driverstation/Joystick.hpp>
#include <wpi/commands2/Command.hpp>
#include <wpi/commands2/CommandHelper.hpp>

#include "robot-cpp/subsystems/drivetrain.hpp"

class JoystickDriveCommand
    : public wpi::cmd::CommandHelper<wpi::cmd::Command, JoystickDriveCommand> {
 public:
  JoystickDriveCommand(wpi::Joystick& joystick, DriveTrain& drivetrain);

  void Execute() override;
  bool IsFinished() override;
  void End(bool interrupted) override;

 private:
  wpi::Joystick& m_joystick;
  DriveTrain& m_drivetrain;
};
