#pragma once

#include <wpi/commands2/SubsystemBase.hpp>
#include <wpi/drive/DifferentialDrive.hpp>
#include <wpi/hardware/imu/OnboardIMU.hpp>
#include <wpi/hardware/motor/PWMVictorSPX.hpp>
#include <wpi/hardware/rotation/Encoder.hpp>
#include <wpi/math/kinematics/DifferentialDriveOdometry.hpp>
#include <wpi/simulation/DifferentialDrivetrainSim.hpp>
#include <wpi/simulation/EncoderSim.hpp>
#include <wpi/simulation/OnboardIMUSim.hpp>
#include <wpi/simulation/SimDeviceSim.hpp>
#include <wpi/smartdashboard/Field2d.hpp>

#include "robot-cpp/subsystems/ports.hpp"

class DriveTrain : public wpi::cmd::SubsystemBase {
 public:
  DriveTrain();

  void ArcadeDrive(double throttle, double rotation);

  double GetHeading();

  void Reset();

  double GetAverageDistance();

  void UpdateOdometry();

  void Periodic() override;

  void SimulationPeriodic() override;

 private:
  void Log();

  wpi::PWMVictorSPX m_leftMotorA{kDrivetrainMotorLeftAPort};
  wpi::PWMVictorSPX m_leftMotorB{kDrivetrainMotorLeftBPort};

  wpi::PWMVictorSPX m_rightMotorA{kDrivetrainMotorRightAPort};
  wpi::PWMVictorSPX m_rightMotorB{kDrivetrainMotorRightBPort};

  wpi::DifferentialDrive m_robotDrive{m_leftMotorA, m_rightMotorA};

  wpi::Encoder m_leftEncoder{kDrivetrainEncoderLeftPortA,
                             kDrivetrainEncoderLeftPortB};
  wpi::Encoder m_rightEncoder{kDrivetrainEncoderRightPortA,
                              kDrivetrainEncoderRightPortB};
  wpi::OnboardIMU m_gyro;

  wpi::math::DifferentialDriveOdometry m_odometry{m_gyro.GetRotation2d(), 0_m,
                                                  0_m};
  wpi::Field2d m_field;

  // Simulation
  wpi::sim::OnboardIMUSim m_gyroSim;
  wpi::sim::EncoderSim m_leftEncoderSim{m_leftEncoder};
  wpi::sim::EncoderSim m_rightEncoderSim{m_rightEncoder};
  wpi::sim::DifferentialDrivetrainSim m_drivetrainSimulator;
};
