package apriltag;

import java.io.IOException;
import org.wpilib.fields.Field;
import org.wpilib.fields.Fields;

public final class Main {
  private Main() {}

  /**
   * Entry point.
   *
   * @param args Command line arguments.
   */
  public static void main(String[] args) throws IOException {
    System.out.println(Field.loadFromResource(Fields.FRC_2022_RAPID_REACT.resourceFile));
  }
}
