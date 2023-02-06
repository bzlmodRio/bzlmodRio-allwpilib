package cscore;

import edu.wpi.first.cscore.CameraServerJNI;
import org.junit.jupiter.api.Test;

class BasicTest {
  @Test
  void basicTest() {
    CameraServerJNI.getHostname();
  }
}
