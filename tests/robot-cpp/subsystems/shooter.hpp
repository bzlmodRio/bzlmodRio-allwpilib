#pragma once

#include <frc/Encoder.h>
#include <frc/controller/PIDController.h>
#include <frc/motorcontrol/PWMVictorSPX.h>
#include <frc/simulation/EncoderSim.h>
#include <frc/simulation/FlywheelSim.h>
#include <frc2/command/Subsystem.h>

#include "robot-cpp/subsystems/ports.hpp"

class Shooter : public frc2::Subsystem {
 public:
  Shooter();

  void Periodic() override;
  void SimulationPeriodic() override;

  void Stop();

  void SpinAtRpm(double rpm);

  double GetRpm();

 private:
  void Log();

  frc::PWMVictorSPX m_motor{kShooterMotorPort};
  frc::Encoder m_encoder{kShooterEncoderPortA, kShooterEncoderPortB};
  frc::PIDController m_controller;

  frc::sim::EncoderSim m_encoderSim{m_encoder};
  frc::sim::FlywheelSim m_flywheelSim;
};
