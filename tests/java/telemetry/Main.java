package telemetry;

import org.wpilib.telemetry.Telemetry;

public class Main {
  public static void main(String[] args) {
    System.out.println("Hello World");

    Telemetry.log("value", 42.0);
  }
}
