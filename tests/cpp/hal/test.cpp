
#include <hal/HAL.h>

#include "gtest/gtest.h"

TEST(BasicTest, Basic) {
  EXPECT_EQ(HAL_RuntimeType::HAL_Runtime_Simulation, HAL_GetRuntimeType());
}
