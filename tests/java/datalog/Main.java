package datalog;

import org.wpilib.datalog.DataLogBackgroundWriter;
import org.wpilib.datalog.DoubleLogEntry;

public class Main {
  public static void main(String[] args) {
    System.out.println("Hello World");

    try (DataLogBackgroundWriter log =
        new DataLogBackgroundWriter(System.getProperty("java.io.tmpdir"))) {
      DoubleLogEntry entry = new DoubleLogEntry(log, "value");
      entry.append(42.0);
    }
  }
}
