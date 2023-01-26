

package bazelrio_test;

import edu.wpi.first.shuffleboard.api.data.DataType;
import edu.wpi.first.shuffleboard.api.plugin.Description;
import edu.wpi.first.shuffleboard.api.plugin.Plugin;
import edu.wpi.first.shuffleboard.api.widget.ComponentType;
import edu.wpi.first.shuffleboard.api.widget.WidgetType;

import java.util.ArrayList;
import java.util.List;
import java.util.HashMap;
import java.util.Map;

public class Main {

    @Description(group = "com.gos.codelabs.shuffleboard.sd_widgets", name = "GirlsOfSteelCodelabPlugin", version = "0.0.0", summary = "Widget for the GOS Shuffleoard Codelab")
    public class GirlsOfSteelCodelabPlugin extends Plugin {

        @Override
        public List<ComponentType> getComponents() {
            return new ArrayList<>();

        }

        @Override
        public List<DataType> getDataTypes() {
            return new ArrayList<>();

        }

        @Override
        public Map<DataType, ComponentType> getDefaultComponents() {
            return new HashMap<>();
        }
    }
}