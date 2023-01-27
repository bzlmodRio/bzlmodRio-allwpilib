
package bazelrio_test;

import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.EnumSource;

import edu.wpi.first.apriltag.AprilTagFields;
import edu.wpi.first.apriltag.AprilTagFieldLayout;
import edu.wpi.first.apriltag.AprilTagDetector;

class BasicTest {
  @ParameterizedTest
  @EnumSource(AprilTagFields.class)
  void testLoad(AprilTagFields field) {
    AprilTagFieldLayout layout =
        Assertions.assertDoesNotThrow(
            () -> AprilTagFieldLayout.loadFromResource(field.m_resourceFile));
    assertNotNull(layout);
  }

  @Test
  void testAprilTagDetector() {
     AprilTagDetector detector = new AprilTagDetector();
     
     var newConfig = new AprilTagDetector.Config();
     detector.addFamily("tag16h5");
     detector.setConfig(newConfig);

     detector.close();
  }
}
