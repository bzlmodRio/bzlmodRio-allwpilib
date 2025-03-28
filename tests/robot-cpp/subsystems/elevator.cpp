#include "robot-cpp/subsystems/elevator.hpp"

#include <frc/RobotController.h>
#include <frc/controller/PIDController.h>
#include <frc/livewindow/LiveWindow.h>
#include <frc/smartdashboard/SmartDashboard.h>

namespace {
constexpr double kP = 5.0;
constexpr double kI = 0.0;
constexpr double kD = 0.0;
constexpr units::volt_t kGravityOffset{0.85};

constexpr double kElevatorGearing = 10.0;
constexpr units::meter_t kElevatorDrumRadius = 2_in;
constexpr units::kilogram_t kCarriageMass = 4.0_kg;

constexpr units::meter_t kMinElevatorHeight = 0_in;
constexpr units::meter_t kMaxElevatorHeight = 50_in;

// distance per pulse = (distance per revolution) / (pulses per revolution)
//  = (Pi * D) / ppr
constexpr double kArmEncoderDistPerPulse =
    2.0 * 3.14 * kElevatorDrumRadius.to<double>() / 4096.0;

frc::DCMotor kElevatorGearbox = frc::DCMotor::Vex775Pro(4);
}  // namespace

Elevator::Elevator()
    : m_controller(kP, kI, kD),
      m_elevatorSim(kElevatorGearbox, kElevatorGearing, kCarriageMass,
                    kElevatorDrumRadius, kMinElevatorHeight, kMaxElevatorHeight,
                    true, units::meter_t{0}) {
  m_controller.SetTolerance(0.005);
  m_encoder.SetDistancePerPulse(kArmEncoderDistPerPulse);
}

void Elevator::Log() {
  frc::SmartDashboard::PutNumber("Elevator Height (m)",
                                 m_encoder.GetDistance());
}

void Elevator::SetVoltage(double output) {
  m_motor.SetVoltage(kGravityOffset + units::volt_t(output));
}

void Elevator::GoToHeight(units::meter_t height) {
  double pidVoltage =
      m_controller.Calculate(m_encoder.GetDistance(), height.to<double>());
  SetVoltage(pidVoltage);
}

bool Elevator::IsAtHeight() { return m_controller.AtSetpoint(); }

void Elevator::Periodic() { Log(); }

void Elevator::SimulationPeriodic() {
  m_elevatorSim.SetInput(Eigen::Vector<double, 1>(
      m_motor.Get() * frc::RobotController::GetInputVoltage()));
  m_elevatorSim.Update(20_ms);
  m_encoderSim.SetDistance(m_elevatorSim.GetPosition().to<double>());
}

void Elevator::Stop() { m_motor.Set(0); }
