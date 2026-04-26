#include "robot-cpp/subsystems/shooter.hpp"

#include <wpi/math/system/Models.hpp>
#include <wpi/smartdashboard/SmartDashboard.hpp>

#include "wpi/system/RobotController.hpp"

namespace {
constexpr double kP = 0.01;
constexpr double kI = 0.0;
constexpr double kD = 0.0;
constexpr double kF = 12.0 / 4700;

constexpr wpi::math::DCMotor kGearbox = wpi::math::DCMotor::Vex775Pro(2);
constexpr double kGearing = 4;
constexpr wpi::units::kilogram_square_meter_t kInertia{0.008};

wpi::math::LinearSystem<1, 1, 1> kPlant{
    wpi::math::Models::FlywheelFromPhysicalConstants(kGearbox, kInertia,
                                                     kGearing)};

}  // namespace

Shooter::Shooter()
    : m_controller(kP, kI, kD), m_flywheelSim(kPlant, kGearbox) {}

void Shooter::Stop() { m_motor.SetDutyCycle(0); }

void Shooter::SpinAtRpm(double rpm) {
  double pidVoltage = m_controller.Calculate(m_encoder.GetRate(), rpm);
  double voltage = pidVoltage + rpm * kF;
  m_motor.SetVoltage(wpi::units::volt_t(voltage));
}
double Shooter::GetRpm() { return m_encoder.GetRate(); }

void Shooter::Periodic() { Log(); }

void Shooter::SimulationPeriodic() {
  m_flywheelSim.SetInput(Eigen::Vector<double, 1>(
      m_motor.GetDutyCycle() * wpi::RobotController::GetInputVoltage()));

  m_flywheelSim.Update(20_ms);
  using rpm_t = wpi::units::revolutions_per_minute_t;
  m_encoderSim.SetRate(
      static_cast<rpm_t>(m_flywheelSim.GetAngularVelocity()).to<double>());
}

void Shooter::Log() {
  wpi::SmartDashboard::PutNumber("Shooter Speed", m_motor.GetDutyCycle());
  wpi::SmartDashboard::PutNumber("Shooter RPM", GetRpm());
}
