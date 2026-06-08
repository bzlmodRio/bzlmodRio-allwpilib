package wpinet;

import java.io.IOException;
import org.junit.jupiter.api.Test;
import org.wpilib.net.WPINetJNI;

class BasicTest {
  @Test
  void basicTest() throws IOException {
    WPINetJNI.forceLoad();
  }
}
