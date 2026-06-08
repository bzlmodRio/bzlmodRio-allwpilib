package hal;

import org.wpilib.hardware.hal.HAL;
import org.junit.jupiter.api.Test;

class BasicTest {
  @Test
  void basicTest() {
    HAL.initialize(500, 0);
  }
}
