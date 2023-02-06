package hal;

import edu.wpi.first.hal.HAL;
import org.junit.jupiter.api.Test;

class BasicTest {
  @Test
  void basicTest() {
    HAL.initialize(500, 0);
  }
}
