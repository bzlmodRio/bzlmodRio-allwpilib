
package bazelrio_test;

import java.io.IOException;
import edu.wpi.first.net.WPINetJNI;

import org.junit.jupiter.api.Test;

class BasicTest {
  @Test
  void basicTest() throws IOException {
    WPINetJNI.forceLoad();
  }
}
