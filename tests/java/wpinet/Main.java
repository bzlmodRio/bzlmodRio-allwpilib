package wpinet;

import java.io.IOException;
import org.wpilib.net.WPINetJNI;

public final class Main {
  private Main() {}

  /**
   * Entry point.
   *
   * @param args Command line arguments.
   */
  public static void main(String[] args) throws IOException {
    WPINetJNI.forceLoad();
  }
}
