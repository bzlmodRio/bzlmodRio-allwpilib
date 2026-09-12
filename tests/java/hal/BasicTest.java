package hal;

import org.junit.jupiter.api.Test;
import org.wpilib.hardware.hal.HAL;

class BasicTest {
  @Test
  void basicTest() {
    HAL.initialize();
  }
}
