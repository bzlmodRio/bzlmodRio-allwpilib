#include "robot-cpp/subsystems/drivetrain.hpp"

#include <numbers>
#include <wpi/driverstation/Joystick.hpp>
#include <wpi/smartdashboard/SmartDashboard.hpp>
#include <wpi/system/RobotController.hpp>
#include <wpi/units/length.hpp>

DriveTrain::DriveTrain()
    :  // m_gyro(wpi::SPI::Port::kMXP),
      m_drivetrainSimulator(
          wpi::sim::DifferentialDrivetrainSim::CreateKitbotSim(
              wpi::sim::DifferentialDrivetrainSim::KitbotMotor::DualCIMPerSide,
              12.0, 6_in)) {
  m_leftMotorA.AddFollower(m_leftMotorB);
  m_rightMotorA.AddFollower(m_rightMotorB);

  // Circumference = diameter * pi. 360 tick simulated encoders.
  m_leftEncoder.SetDistancePerPulse(wpi::units::foot_t{4_in}.to<double>() *
                                    std::numbers::pi / 360.0);
  m_rightEncoder.SetDistancePerPulse(wpi::units::foot_t{4_in}.to<double>() *
                                     std::numbers::pi / 360.0);

  wpi::SmartDashboard::PutData("Field", &m_field);
}

void DriveTrain::Log() {
  wpi::SmartDashboard::PutNumber("Left Distance", m_leftEncoder.GetDistance());
  wpi::SmartDashboard::PutNumber("Right Distance",
                                 m_rightEncoder.GetDistance());
  wpi::SmartDashboard::PutNumber("Left Speed", m_leftEncoder.GetRate());
  wpi::SmartDashboard::PutNumber("Right Speed", m_rightEncoder.GetRate());
  // wpi::SmartDashboard::PutNumber("Gyro", m_gyro.GetAngle());
}

void DriveTrain::ArcadeDrive(double throttle, double rotation) {
  m_robotDrive.ArcadeDrive(throttle, rotation);
}

double DriveTrain::GetHeading() {
  return 0;
  // return m_gyro.GetAngle();
}

void DriveTrain::Reset() {
  // m_gyro.Reset();
  m_leftEncoder.Reset();
  m_rightEncoder.Reset();
}

double DriveTrain::GetAverageDistance() {
  return (m_leftEncoder.GetDistance() + m_rightEncoder.GetDistance()) / 2.0;
}

void DriveTrain::UpdateOdometry() {
  // m_odometry.Update(m_gyro.GetRotation2d(),
  //                   units::meter_t(m_leftEncoder.GetDistance()),
  //                   units::meter_t(m_rightEncoder.GetDistance()));
  m_odometry.Update(wpi::math::Rotation2d{},
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
      wpi::units::volt_t{m_leftMotorA.GetDutyCycle()} *
          wpi::RobotController::GetInputVoltage(),
      wpi::units::volt_t{-m_rightMotorA.GetDutyCycle()} *
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
  // m_gyroSim.SetAngle(-m_drivetrainSimulator.GetHeading().Degrees());
}
