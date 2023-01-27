

package bazelrio_test;

import java.io.IOException;
import edu.wpi.first.net.WPINetJNI;

public class Main {
    public static void main(String[] args) throws IOException {
        WPINetJNI.forceLoad();
    }
}