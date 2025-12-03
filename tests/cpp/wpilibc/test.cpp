
#include <hal/Accelerometer.h>
#include <hal/HALBase.h>

#include "frc/simulation/BuiltInAccelerometerSim.h"
#include "gtest/gtest.h"

TEST(BasicTest, Basic) {
  HAL_Initialize(500, 0);

  frc::sim::BuiltInAccelerometerSim sim;

  sim.ResetData();

  bool wasTriggered = false;
  bool lastValue = false;

  auto cb = sim.RegisterActiveCallback(
      [&](std::string_view /*name*/, const HAL_Value* value) {
        wasTriggered = true;
        lastValue = value->data.v_boolean;
      },
      false);

  EXPECT_FALSE(wasTriggered);

  HAL_SetAccelerometerActive(true);

  EXPECT_TRUE(wasTriggered);
  EXPECT_TRUE(lastValue);
}
