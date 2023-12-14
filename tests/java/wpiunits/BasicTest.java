package wpiunits;

import static org.junit.jupiter.api.Assertions.assertTrue;

import edu.wpi.first.units.Units;
import org.junit.jupiter.api.Test;

class BasicTest {
  @Test
  void testOf() {
    assertTrue(Units.Volts.times(Units.Amps, "", "").equivalent(Units.Watts));
  }
}
