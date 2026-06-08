#pragma once

#include <wpi/commands2/Command.hpp>
#include <wpi/commands2/CommandHelper.hpp>

#include "robot-cpp/subsystems/elevator.hpp"

class SetElevatorSetpoint
    : public wpi::cmd::CommandHelper<wpi::cmd::Command, SetElevatorSetpoint> {
 public:
  explicit SetElevatorSetpoint(Elevator& elevator,
                               wpi::units::meter_t setpoint);
  void Execute() override;
  bool IsFinished() override;
  void End(bool interrupted) override;

 private:
  Elevator& m_elevator;
  wpi::units::meter_t m_height;
};
