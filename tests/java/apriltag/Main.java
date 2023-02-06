package apriltag;

import edu.wpi.first.apriltag.AprilTagFieldLayout;
import edu.wpi.first.apriltag.AprilTagFields;
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
