
package bazelrio_test;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.EnumSource;

import edu.wpi.fields.Fields;
import edu.wpi.fields.FieldConfig;

class LoadConfigTest {
  @ParameterizedTest
  @EnumSource(Fields.class)
  void testLoad(Fields field) {
    FieldConfig config = Assertions.assertDoesNotThrow(() -> FieldConfig.loadField(field));

    Assertions.assertNotNull(config.getImageUrl());
  }
}
