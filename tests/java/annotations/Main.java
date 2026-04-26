package annotations;

import org.wpilib.annotation.NoDiscard;

public class Main {
  public static void main(String[] args) {
    testFunc();
  }

  @NoDiscard("Test No Discard")
  private static int testFunc() {
    return 1;
  }
}
