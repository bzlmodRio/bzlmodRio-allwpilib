package fieldimages;

import edu.wpi.fields.FieldConfig;
import edu.wpi.fields.Fields;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.EnumSource;

class BasicTest {
  @ParameterizedTest
  @EnumSource(Fields.class)
  void testLoad(Fields field) {
    FieldConfig config = Assertions.assertDoesNotThrow(() -> FieldConfig.loadField(field));

    Assertions.assertNotNull(config.getImageUrl());
  }
}
