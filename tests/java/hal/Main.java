package hal;

import edu.wpi.first.hal.HAL;

public final class Main {
  private Main() {}

  /**
   * Entry point.
   *
   * @param args Command line arguments.
   */
  public static void main(String[] args) {
    System.out.println("Hello World");
    HAL.initialize(500, 0);
  }
}
