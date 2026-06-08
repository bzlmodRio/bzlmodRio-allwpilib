
#include <wpi/hal/HAL.h>

#include "gtest/gtest.h"

TEST(BasicTest, Basic) {
  EXPECT_EQ(HAL_RuntimeType::HAL_RUNTIME_SIMULATION, HAL_GetRuntimeType());
}
