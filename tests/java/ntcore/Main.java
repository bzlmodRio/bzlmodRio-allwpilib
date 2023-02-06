package ntcore;

import edu.wpi.first.networktables.NetworkTableInstance;

public final class Main {
  private Main() {}

  /**
   * Entry point.
   *
   * @param args Command line arguments.
   */
  public static void main(String[] args) {
    System.out.println("Hello World");

    NetworkTableInstance serverInst = NetworkTableInstance.create();
    NetworkTableInstance clientInst = NetworkTableInstance.create();

    serverInst.startServer("topiclistenertest.json", "127.0.0.1", 10010);
    clientInst.startClient4("client");
    clientInst.setServer("127.0.0.1", 10010);

    System.out.println("Hello World");
  }
}
