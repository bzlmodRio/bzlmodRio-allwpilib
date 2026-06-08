package wpiutil;

import org.wpilib.util.container.CircularBuffer;
import org.wpilib.util.runtime.CombinedRuntimeLoader;
import org.wpilib.util.WPIUtilJNI;

public final class Main {
  private Main() {}

  private static final double[] m_values = {
    751.848, 766.366, 342.657, 234.252, 716.126, 132.344, 445.697, 22.727, 421.125, 799.913
  };

  /**
   * Entry point.
   *
   * @param args Command line arguments.
   */
  public static void main(String[] args) {
    System.out.println("Hello World");
    System.out.println(System.getProperty("user.dir"));

    CircularBuffer<Double> queue = new CircularBuffer<Double>(8);

    for (double value : m_values) {
      queue.addLast(value);
    }

    System.out.println(queue);
    System.out.println(CombinedRuntimeLoader.getExtractionDirectory());
    System.out.println(WPIUtilJNI.now());
  }
}
