
#include <hal/HALBase.h>

#include "frc/AnalogInput.h"
#include "frc/simulation/AnalogInputSim.h"
#include "gtest/gtest.h"

TEST(BasicTest, Basic) {
  HAL_Initialize(500, 0);

  frc::sim::AnalogInputSim sim(1);

  sim.ResetData();

  bool wasTriggered = false;
  bool lastValue = false;

  auto cb = sim.RegisterInitializedCallback(
      [&](std::string_view /*name*/, const HAL_Value *value) {
        wasTriggered = true;
        lastValue = value->data.v_boolean;
      },
      false);

  EXPECT_FALSE(wasTriggered);

  frc::AnalogInput _(1);

  EXPECT_TRUE(wasTriggered);
  EXPECT_TRUE(lastValue);
}
