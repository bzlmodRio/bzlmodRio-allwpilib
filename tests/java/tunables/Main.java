package tunables;

import org.wpilib.tunable.TunableDouble;

public class Main {
  public static void main(String[] args) {
    System.out.println("Hello World");

    TunableDouble value = TunableDouble.create(1.0);
    System.out.println(value.getAsDouble());
  }
}
