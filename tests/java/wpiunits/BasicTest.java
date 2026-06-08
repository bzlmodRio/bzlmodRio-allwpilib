package wpiunits;

import static org.junit.jupiter.api.Assertions.assertTrue;

import org.wpilib.units.Units;
import org.junit.jupiter.api.Test;

class BasicTest {
  @Test
  void testOf() {
    assertTrue(Units.Volts.mult(Units.Amps, "", "").equivalent(Units.Watts));
  }
}
