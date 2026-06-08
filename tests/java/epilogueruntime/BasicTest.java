package epilogueruntime;

import static org.junit.jupiter.api.Assertions.assertTrue;

import org.wpilib.epilogue.Logged;
import org.junit.jupiter.api.Test;

class BasicTest {
  @Logged private double m_x;

  @Test
  void basicTest() {
    assertTrue(true); // TODO make test
  }
}
