package tunables;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;
import org.wpilib.tunable.TunableDouble;

class BasicTest {
  @Test
  void basicTest() {
    TunableDouble value = TunableDouble.create(1.0);
    assertEquals(1.0, value.getAsDouble());
  }
}
