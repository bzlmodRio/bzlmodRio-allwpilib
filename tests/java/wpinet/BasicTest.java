package wpinet;

import edu.wpi.first.net.WPINetJNI;
import java.io.IOException;
import org.junit.jupiter.api.Test;

class BasicTest {
  @Test
  void basicTest() throws IOException {
    WPINetJNI.forceLoad();
  }
}
