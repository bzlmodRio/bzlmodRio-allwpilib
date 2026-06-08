package cscore;

import org.junit.jupiter.api.Test;
import org.wpilib.vision.camera.CameraServerJNI;

class BasicTest {
  @Test
  void basicTest() {
    CameraServerJNI.getHostname();
  }
}
