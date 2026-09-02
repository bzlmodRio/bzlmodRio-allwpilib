package fields;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.EnumSource;
import org.wpilib.fields.Field;
import org.wpilib.fields.Fields;

class BasicTest {
  @ParameterizedTest
  @EnumSource(Fields.class)
  void testLoad(Fields field) {
    Field config = Assertions.assertDoesNotThrow(() -> Field.loadField(field));

    Assertions.assertNotNull(config.fieldImage.path);
  }
}
