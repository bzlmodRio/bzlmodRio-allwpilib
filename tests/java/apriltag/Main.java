

package bazelrio_test;

import java.io.IOException;
import edu.wpi.first.apriltag.AprilTagFields;
import edu.wpi.first.apriltag.AprilTagFieldLayout;

public class Main {
    public static void main(String[] args) throws IOException {
        System.out.println(AprilTagFieldLayout.loadFromResource(AprilTagFields.k2022RapidReact.m_resourceFile));
    }
}