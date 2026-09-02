
#include "gtest/gtest.h"
#include "wpi/drivers/odometry/GoBildaPinpoint.hpp"
#include "wpi/hal/HAL.h"

TEST(BasicTest, BasicTest) {
  HAL_Initialize();
  wpi::GoBildaPinpoint pinpoint{wpi::I2C::Port::PORT_0};
  EXPECT_EQ(pinpoint.GetDeviceAddress(), 0x31);
}
