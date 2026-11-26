package drivers;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;
import org.wpilib.drivers.motor.PWMVictorSPX;
import org.wpilib.hardware.hal.HAL;

class BasicTest {
  @Test
  void basicTest() {
    HAL.initialize();
    try (PWMVictorSPX motor = new PWMVictorSPX(0)) {
      motor.setThrottle(0.5);
      assertEquals(0.5, motor.getThrottle(), 0.01);
    }
  }
}
