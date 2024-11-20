#pragma once

#include <frc2/command/Command.h>
#include <frc2/command/CommandHelper.h>

#include "robot-cpp/subsystems/shooter.hpp"

class ShooterRpmCommand
    : public frc2::CommandHelper<frc2::Command, ShooterRpmCommand> {
 public:
  ShooterRpmCommand(Shooter &shooter, double rpm);
  void Execute() override;
  bool IsFinished() override;
  void End(bool interrupted) override;

 private:
  Shooter &m_shooter;
  const double m_rpm;
};
