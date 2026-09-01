package ntcore;

import org.junit.jupiter.api.Test;
import org.wpilib.networktables.NetworkTablesJNI;

class BasicTest {
  @Test
  void basicTest() {
    int inst = NetworkTablesJNI.getDefaultInstance();
    NetworkTablesJNI.flush(inst);
  }
}
