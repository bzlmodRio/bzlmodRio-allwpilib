
package bazelrio_test;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.EnumSource;

import edu.wpi.fields.FieldImages;

class LoadConfigTest {
  void testLoad() {
    Assertions.assertNotNull(FieldImages.k2018PowerUpFieldConfig);
  }
}
