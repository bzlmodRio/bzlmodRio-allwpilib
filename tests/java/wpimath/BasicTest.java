package wpimath;

import static org.junit.jupiter.api.Assertions.assertAll;
import static org.junit.jupiter.api.Assertions.assertEquals;

import edu.wpi.first.math.geometry.Pose2d;
import edu.wpi.first.math.geometry.Rotation2d;
import edu.wpi.first.math.geometry.Transform2d;
import edu.wpi.first.math.geometry.Translation2d;
import org.junit.jupiter.api.Test;

class BasicTest {
  private static final double kEpsilon = 1E-9;

  @Test
  void basicTest() {
    Pose2d initial = new Pose2d(new Translation2d(1.0, 2.0), Rotation2d.fromDegrees(45.0));
    Transform2d transformation =
        new Transform2d(new Translation2d(5.0, 0.0), Rotation2d.fromDegrees(5.0));

    Pose2d transformed = initial.plus(transformation);

    assertAll(
        () -> assertEquals(transformed.getX(), 1 + 5.0 / Math.sqrt(2.0), kEpsilon),
        () -> assertEquals(transformed.getY(), 2 + 5.0 / Math.sqrt(2.0), kEpsilon),
        () -> assertEquals(transformed.getRotation().getDegrees(), 50.0, kEpsilon));
  }
}
