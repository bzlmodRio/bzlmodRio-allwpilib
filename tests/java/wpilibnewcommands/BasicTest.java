package wpilibnewcommands;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import edu.wpi.first.wpilibj.DriverStation;
import edu.wpi.first.wpilibj.simulation.DriverStationSim;
import edu.wpi.first.wpilibj2.command.CommandScheduler;
import edu.wpi.first.wpilibj2.command.StartEndCommand;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class BasicTest {
  public class ConditionHolder {
    private boolean m_condition;

    public void setCondition(boolean condition) {
      m_condition = condition;
    }

    public boolean getCondition() {
      return m_condition;
    }
  }

  @BeforeEach
  void commandSetup() {
    CommandScheduler.getInstance().cancelAll();
    CommandScheduler.getInstance().enable();
    CommandScheduler.getInstance().getActiveButtonLoop().clear();
    CommandScheduler.getInstance().clearComposedCommands();
    setDSEnabled(true);
  }

  public void setDSEnabled(boolean enabled) {
    DriverStationSim.setDsAttached(true);

    DriverStationSim.setEnabled(enabled);
    DriverStationSim.notifyNewData();
    while (DriverStation.isEnabled() != enabled) {
      try {
        Thread.sleep(1);
      } catch (InterruptedException exception) {
        exception.printStackTrace();
      }
    }
  }

  @Test
  void basicTest() {
    try (CommandScheduler scheduler = CommandScheduler.getInstance()) {
      ConditionHolder cond1 = new ConditionHolder();
      ConditionHolder cond2 = new ConditionHolder();

      StartEndCommand command =
          new StartEndCommand(() -> cond1.setCondition(true), () -> cond2.setCondition(true));

      scheduler.schedule(command);
      scheduler.run();

      assertTrue(scheduler.isScheduled(command));

      scheduler.cancel(command);

      assertFalse(scheduler.isScheduled(command));
      assertTrue(cond1.getCondition());
      assertTrue(cond2.getCondition());
    }
  }
}
