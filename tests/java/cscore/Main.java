package cscore;

import edu.wpi.first.cscore.CameraServerJNI;
import org.opencv.core.Core;
import org.opencv.core.CvType;
import org.opencv.core.Mat;

public final class Main {
  private Main() {}

  /**
   * Entry point.
   *
   * @param args Command line arguments.
   */
  public static void main(String[] args) {
    System.out.println("Hello World");
    System.out.println(System.getProperty("user.dir"));

    System.out.println(CameraServerJNI.getHostname());

    System.loadLibrary(Core.NATIVE_LIBRARY_NAME);
    Mat mat = Mat.eye(3, 3, CvType.CV_8UC1);
    System.out.println("mat = " + mat.dump());
  }
}
