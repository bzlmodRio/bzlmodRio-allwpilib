package apriltag;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.wpilib.vision.apriltag.AprilTagDetector;
import org.wpilib.vision.apriltag.AprilTagFieldLayout;
import org.wpilib.vision.apriltag.AprilTagFields;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.EnumSource;

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
