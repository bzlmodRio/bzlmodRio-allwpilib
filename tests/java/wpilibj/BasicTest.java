package wpilibj;

import static org.junit.jupiter.api.Assertions.assertTrue;

import edu.wpi.first.math.filter.SlewRateLimiter;
import edu.wpi.first.wpilibj.Timer;
import org.junit.jupiter.api.Test;

class BasicTest {
  @Test
  void basicTest() {
    SlewRateLimiter limiter = new SlewRateLimiter(1);
    Timer.delay(1);
    assertTrue(limiter.calculate(2) < 2);
  }
}
