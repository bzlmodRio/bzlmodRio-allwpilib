package wpiunits;

import org.wpilib.units.Units;

public final class Main {
  private Main() {}

  public static void main(String[] args) {
    System.out.println(Units.Volts.mult(Units.Amps, "", "").equivalent(Units.Watts));
  }
}
