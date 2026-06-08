package wpiutil;

import static org.junit.jupiter.api.Assertions.assertDoesNotThrow;

import org.wpilib.util.WPIUtilJNI;
import org.junit.jupiter.api.Test;

class BasicTest {
  @Test
  void basicTest() {
    assertDoesNotThrow(WPIUtilJNI::now);
  }
}
