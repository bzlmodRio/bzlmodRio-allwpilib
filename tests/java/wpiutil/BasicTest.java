package wpiutil;

import static org.junit.jupiter.api.Assertions.assertDoesNotThrow;

import org.junit.jupiter.api.Test;
import org.wpilib.util.WPIUtilJNI;

class BasicTest {
  @Test
  void basicTest() {
    assertDoesNotThrow(WPIUtilJNI::now);

    WPIUtilJNI.checkMsvcRuntime();
  }
}
