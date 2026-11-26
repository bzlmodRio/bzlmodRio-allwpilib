package commandsv2;

import org.wpilib.command2.Command;
import org.wpilib.command2.Subsystem;
import org.wpilib.framework.RobotBase;
import org.wpilib.framework.TimedRobot;
import org.wpilib.simulation.DriverStationSim;
import org.wpilib.vision.stream.CameraServer;

/**
 * Do NOT add any static variables to this class, or any initialization at all. Unless you know what
 * you are doing, do not modify this file except to change the parameter class to the startRobot
 * call.
 */
public final class Main {
  private static class ExampleSubsystem implements Subsystem {
    @Override
    public void periodic() {
      System.out.println("subsystem Periodic");
    }
  }

  private static class ExampleCommand extends Command {
    ExampleCommand(ExampleSubsystem sub) {
      addRequirements(sub);
    }

    @Override
    public void execute() {
      System.out.println("command executing");
    }
  }

  private static class Robot extends TimedRobot {
    private final ExampleSubsystem m_subsystem = new ExampleSubsystem();

    public Robot() {
      CameraServer.startAutomaticCapture();

      m_subsystem.setDefaultCommand(new ExampleCommand(m_subsystem));

      if (RobotBase.isSimulation()) {
        DriverStationSim.setEnabled(true);
      }
    }

    @Override
    public void robotPeriodic() {
      System.out.println("Robot Periodic");
    }
  }

  private Main() {}

  /**
   * Main initialization function. Do not perform any initialization here.
   *
   * <p>If you change your main robot class, change the parameter type.
   */
  public static void main(String... args) {
    RobotBase.startRobot(Robot::new);
  }
}
