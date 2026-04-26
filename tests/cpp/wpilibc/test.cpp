
#include <wpi/hal/HALBase.h>

#include "wpi/hardware/discrete/AnalogInput.hpp"
#include "wpi/simulation/AnalogInputSim.hpp"
#include "gtest/gtest.h"

TEST(BasicTest, Basic) {
  HAL_Initialize(500, 0);

  wpi::sim::AnalogInputSim sim(1);

  sim.ResetData();

  bool wasTriggered = false;
  bool lastValue = false;

  auto cb = sim.RegisterInitializedCallback(
      [&](std::string_view /*name*/, const HAL_Value* value) {
        wasTriggered = true;
        lastValue = value->data.v_boolean;
      },
      false);

  EXPECT_FALSE(wasTriggered);

  wpi::AnalogInput _(1);

  EXPECT_TRUE(wasTriggered);
  EXPECT_TRUE(lastValue);
}
