package wpinet;

import edu.wpi.first.net.WPINetJNI;
import java.io.IOException;

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
