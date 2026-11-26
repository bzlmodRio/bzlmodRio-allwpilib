package apriltag;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.EnumSource;
import org.wpilib.fields.Field;
import org.wpilib.fields.Fields;
import org.wpilib.vision.apriltag.AprilTagDetector;

class BasicTest {
  @ParameterizedTest
  @EnumSource(Fields.class)
  void testLoad(Fields field) {
    Field layout = Assertions.assertDoesNotThrow(() -> Field.loadFromResource(field.resourceFile));
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
