package fields;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.EnumSource;
import org.wpilib.fields.FieldConfig;
import org.wpilib.fields.Fields;

class BasicTest {
  @ParameterizedTest
  @EnumSource(Fields.class)
  void testLoad(Fields field) {
    FieldConfig config = Assertions.assertDoesNotThrow(() -> FieldConfig.loadField(field));

    Assertions.assertNotNull(config.getImageUrl());
  }
}
