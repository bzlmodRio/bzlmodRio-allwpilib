#pragma once

#include <wpi/commands2/Command.hpp>
#include <wpi/commands2/CommandHelper.hpp>

#include "robot-cpp/subsystems/shooter.hpp"

class ShooterRpmCommand
    : public wpi::cmd::CommandHelper<wpi::cmd::Command, ShooterRpmCommand> {
 public:
  ShooterRpmCommand(Shooter& shooter, double rpm);
  void Execute() override;
  bool IsFinished() override;
  void End(bool interrupted) override;

 private:
  Shooter& m_shooter;
  const double m_rpm;
};
