package cscore;

import org.wpilib.vision.camera.CameraServerJNI;
import org.junit.jupiter.api.Test;

class BasicTest {
  @Test
  void basicTest() {
    CameraServerJNI.getHostname();
  }
}
