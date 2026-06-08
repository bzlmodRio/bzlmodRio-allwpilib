package ntcore;

import org.wpilib.networktables.NetworkTablesJNI;
import org.junit.jupiter.api.Test;

class BasicTest {
  @Test
  void basicTest() {
    int inst = NetworkTablesJNI.getDefaultInstance();
    NetworkTablesJNI.flush(inst);
  }
}
