package datalog;

import static org.junit.jupiter.api.Assertions.assertDoesNotThrow;

import org.junit.jupiter.api.Test;
import org.wpilib.datalog.DataLogBackgroundWriter;
import org.wpilib.datalog.DoubleLogEntry;

class BasicTest {
  @Test
  void basicTest() {
    assertDoesNotThrow(
        () -> {
          try (DataLogBackgroundWriter log =
              new DataLogBackgroundWriter(System.getProperty("java.io.tmpdir"))) {
            DoubleLogEntry entry = new DoubleLogEntry(log, "value");
            entry.append(42.0);
          }
        });
  }
}
