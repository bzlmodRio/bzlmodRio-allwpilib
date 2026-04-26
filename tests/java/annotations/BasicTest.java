package annotations;

import org.junit.jupiter.api.Test;
import org.wpilib.annotation.NoDiscard;

class BasicTest {
  @Test
  void basicTest() {
    testFunc();
  }

  @NoDiscard("Test No Discard")
  private int testFunc() {
    return 1;
  }
}
