package wpilibj;

import org.wpilib.vision.stream.CameraServer;
import org.wpilib.framework.RobotBase;
import org.wpilib.framework.TimedRobot;

/**
 * Do NOT add any static variables to this class, or any initialization at all. Unless you know what
 * you are doing, do not modify this file except to change the parameter class to the startRobot
 * call.
 */
public final class Main {
  private static class Robot extends TimedRobot {
    @Override
    public void robotInit() {
      CameraServer.startAutomaticCapture();
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
