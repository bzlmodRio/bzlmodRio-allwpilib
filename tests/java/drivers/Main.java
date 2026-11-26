package drivers;

import org.wpilib.drivers.motor.PWMVictorSPX;
import org.wpilib.hardware.hal.HAL;

public class Main {
  public static void main(String[] args) {
    System.out.println("Hello World");

    HAL.initialize();
    try (PWMVictorSPX motor = new PWMVictorSPX(0)) {
      motor.setThrottle(0);
    }
  }
}
