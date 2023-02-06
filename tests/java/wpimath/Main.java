package wpimath;

import org.ejml.simple.SimpleMatrix;

public final class Main {
  private Main() {}

  /**
   * Entry point.
   *
   * @param args Command line arguments.
   */
  public static void main(String[] args) {
    int n1 = 4;

    SimpleMatrix A1 =
        new SimpleMatrix(
                n1, n1, true, new double[] {0.5, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0})
            .transpose();

    System.out.println(A1);
  }
}
