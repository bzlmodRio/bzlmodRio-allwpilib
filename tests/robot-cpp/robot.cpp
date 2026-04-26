#include "robot-cpp/robot.hpp"

#include <wpi/cameraserver/CameraServer.hpp>
#include <wpi/commands2/CommandScheduler.hpp>
#include <wpi/commands2/button/JoystickButton.hpp>

#include "robot-cpp/commands/elevator_setpoint_command.hpp"
#include "robot-cpp/commands/joystick_drive_command.hpp"
#include "robot-cpp/commands/shooter_rpm_command.hpp"

Robot::Robot() {
  wpi::CameraServer::StartAutomaticCapture();

  m_drivetrain.SetDefaultCommand(
      JoystickDriveCommand{m_joystick, m_drivetrain});

  wpi::cmd::JoystickButton shootFastButton{&m_joystick, 1};
  wpi::cmd::JoystickButton shootSlowButton{&m_joystick, 2};
  wpi::cmd::JoystickButton elevatorLowButton{&m_joystick, 3};
  wpi::cmd::JoystickButton elevatorMidButton{&m_joystick, 4};
  wpi::cmd::JoystickButton elevatorHighButton{&m_joystick, 5};

  shootFastButton.WhileTrue(ShooterRpmCommand(m_shooter, 1000).ToPtr());
  shootSlowButton.WhileTrue(ShooterRpmCommand(m_shooter, 1500).ToPtr());

  elevatorLowButton.WhileTrue(SetElevatorSetpoint(m_elevator, 10_in).ToPtr());
  elevatorMidButton.WhileTrue(SetElevatorSetpoint(m_elevator, 20_in).ToPtr());
  elevatorHighButton.WhileTrue(SetElevatorSetpoint(m_elevator, 30_in).ToPtr());
}

void Robot::RobotPeriodic() { wpi::cmd::CommandScheduler::GetInstance().Run(); }
