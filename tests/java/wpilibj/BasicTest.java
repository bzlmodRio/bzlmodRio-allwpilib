package wpilibj;

import static org.junit.jupiter.api.Assertions.assertTrue;

import org.wpilib.math.filter.SlewRateLimiter;
import org.wpilib.system.Timer;
import org.junit.jupiter.api.Test;

class BasicTest {
  @Test
  void basicTest() {
    SlewRateLimiter limiter = new SlewRateLimiter(1);
    Timer.delay(1);
    assertTrue(limiter.calculate(2) < 2);
  }
}
