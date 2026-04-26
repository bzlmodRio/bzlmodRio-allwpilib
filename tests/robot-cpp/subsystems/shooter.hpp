#pragma once

#include <wpi/hardware/rotation/Encoder.hpp>
#include <wpi/math/controller/PIDController.hpp>
#include <wpi/hardware/motor/PWMVictorSPX.hpp>
#include <wpi/simulation/EncoderSim.hpp>
#include <wpi/simulation/FlywheelSim.hpp>
#include <wpi/commands2/Subsystem.hpp>

#include "robot-cpp/subsystems/ports.hpp"

class Shooter : public wpi::cmd::Subsystem {
 public:
  Shooter();

  void Periodic() override;
  void SimulationPeriodic() override;

  void Stop();

  void SpinAtRpm(double rpm);

  double GetRpm();

 private:
  void Log();

  wpi::PWMVictorSPX m_motor{kShooterMotorPort};
  wpi::Encoder m_encoder{kShooterEncoderPortA, kShooterEncoderPortB};
  wpi::math::PIDController m_controller;

  wpi::sim::EncoderSim m_encoderSim{m_encoder};
  wpi::sim::FlywheelSim m_flywheelSim;
};
