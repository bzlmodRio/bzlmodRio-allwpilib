#include "robot-cpp/subsystems/drivetrain.hpp"

#include <numbers>
#include <wpi/driverstation/Joystick.hpp>
#include <wpi/system/RobotController.hpp>
#include <wpi/telemetry/Telemetry.hpp>
#include <wpi/units/length.hpp>

DriveTrain::DriveTrain()
    : m_gyro(wpi::OnboardIMU::FLAT),
      m_drivetrainSimulator(
          wpi::sim::DifferentialDrivetrainSim::CreateKitbotSim(
              wpi::sim::DifferentialDrivetrainSim::KitbotMotor::
                  DUAL_CIM_PER_SIDE,
              12.0, 6_in)) {
  m_leftMotorA.AddFollower(m_leftMotorB);
  m_rightMotorA.AddFollower(m_rightMotorB);

  // Circumference = diameter * pi. 360 tick simulated encoders.
  m_leftEncoder.SetDistancePerPulse(wpi::units::foot_t{4_in}.to<double>() *
                                    std::numbers::pi / 360.0);
  m_rightEncoder.SetDistancePerPulse(wpi::units::foot_t{4_in}.to<double>() *
                                     std::numbers::pi / 360.0);

  wpi::telemetry::Log("Field", m_field);
}

void DriveTrain::Log() {
  wpi::telemetry::Log("Left Distance", m_leftEncoder.GetDistance());
  wpi::telemetry::Log("Right Distance", m_rightEncoder.GetDistance());
  wpi::telemetry::Log("Left Speed", m_leftEncoder.GetRate());
  wpi::telemetry::Log("Right Speed", m_rightEncoder.GetRate());
  wpi::telemetry::Log("Gyro", m_gyro.GetYaw().value());
}

void DriveTrain::ArcadeDrive(double throttle, double rotation) {
  m_robotDrive.ArcadeDrive(throttle, rotation);
}

double DriveTrain::GetHeading() { return m_gyro.GetYaw().value(); }

void DriveTrain::Reset() {
  m_gyro.ResetYaw();
  m_leftEncoder.Reset();
  m_rightEncoder.Reset();
}

double DriveTrain::GetAverageDistance() {
  return (m_leftEncoder.GetDistance() + m_rightEncoder.GetDistance()) / 2.0;
}

void DriveTrain::UpdateOdometry() {
  m_odometry.Update(m_gyro.GetRotation2d(),
                    wpi::units::meter_t(m_leftEncoder.GetDistance()),
                    wpi::units::meter_t(m_rightEncoder.GetDistance()));
  m_field.SetRobotPose(m_odometry.GetPose());
}

void DriveTrain::Periodic() {
  UpdateOdometry();
  Log();
}

void DriveTrain::SimulationPeriodic() {
  // To update our simulation, we set motor voltage inputs, update the
  // simulation, and write the simulated positions and velocities to our
  // simulated encoder and gyro. We negate the right side so that positive
  // voltages make the right side move forward.
  m_drivetrainSimulator.SetInputs(
      wpi::units::volt_t{m_leftMotorA.GetThrottle()} *
          wpi::RobotController::GetInputVoltage(),
      wpi::units::volt_t{-m_rightMotorA.GetThrottle()} *
          wpi::RobotController::GetInputVoltage());
  m_drivetrainSimulator.Update(20_ms);

  m_leftEncoderSim.SetDistance(
      m_drivetrainSimulator.GetLeftPosition().to<double>());
  m_leftEncoderSim.SetRate(
      m_drivetrainSimulator.GetLeftVelocity().to<double>());
  m_rightEncoderSim.SetDistance(
      m_drivetrainSimulator.GetRightPosition().to<double>());
  m_rightEncoderSim.SetRate(
      m_drivetrainSimulator.GetRightVelocity().to<double>());
  m_gyroSim.SetYaw(-m_drivetrainSimulator.GetHeading().Degrees());
}
