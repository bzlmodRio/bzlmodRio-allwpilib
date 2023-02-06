package cameraserver;

import edu.wpi.first.cameraserver.CameraServer;

public final class Main {
  private Main() {}

  /**
   * Entry point.
   *
   * @param args Command line arguments.
   */
  public static void main(String[] args) {
    System.out.println("Hello World");
    CameraServer.startAutomaticCapture();
    System.out.println("Hello World");
  }
}
