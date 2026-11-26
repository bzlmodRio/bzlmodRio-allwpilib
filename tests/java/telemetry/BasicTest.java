package telemetry;

import static org.junit.jupiter.api.Assertions.assertDoesNotThrow;

import org.junit.jupiter.api.Test;
import org.wpilib.telemetry.Telemetry;

class BasicTest {
  @Test
  void basicTest() {
    assertDoesNotThrow(() -> Telemetry.log("value", 42.0));
  }
}
