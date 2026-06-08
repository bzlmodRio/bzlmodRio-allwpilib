package apriltag;

import org.wpilib.vision.apriltag.AprilTagFieldLayout;
import org.wpilib.vision.apriltag.AprilTagFields;
import java.io.IOException;

public final class Main {
  private Main() {}

  /**
   * Entry point.
   *
   * @param args Command line arguments.
   */
  public static void main(String[] args) throws IOException {
    System.out.println(
        AprilTagFieldLayout.loadFromResource(AprilTagFields.k2022RapidReact.m_resourceFile));
  }
}
