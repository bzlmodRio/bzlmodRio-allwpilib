#pragma once

#include <wpi/hardware/rotation/Encoder.hpp>
#include <wpi/math/controller/PIDController.hpp>
#include <wpi/hardware/motor/PWMVictorSPX.hpp>
#include <wpi/simulation/ElevatorSim.hpp>
#include <wpi/simulation/EncoderSim.hpp>
#include <wpi/commands2/Subsystem.hpp>

#include "robot-cpp/subsystems/ports.hpp"

class Elevator : public wpi::cmd::Subsystem {
 public:
  Elevator();

  void Stop();

  void SetVoltage(double output);

  void GoToHeight(wpi::units::meter_t height);

  bool IsAtHeight();

  void Periodic() override;

  void SimulationPeriodic() override;

 private:
  void Log();

  wpi::PWMVictorSPX m_motor{kElevatorMotorPort};
  wpi::Encoder m_encoder{kElevatorEncoderPortA, kElevatorEncoderPortB};
  double m_setpoint{0};
  wpi::math::PIDController m_controller;

  wpi::sim::EncoderSim m_encoderSim{m_encoder};
  wpi::sim::ElevatorSim m_elevatorSim;
};
