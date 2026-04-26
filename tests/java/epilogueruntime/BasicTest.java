package epilogueruntime;

import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.Test;
import org.wpilib.epilogue.Logged;

class BasicTest {
  @Logged private double m_x;

  @Test
  void basicTest() {
    assertTrue(true); // TODO make test
  }
}
