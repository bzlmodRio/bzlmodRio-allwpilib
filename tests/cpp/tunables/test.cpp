
#include "gtest/gtest.h"
#include "wpi/tunables/Tunable.hpp"
#include "wpi/tunables/Tunables.hpp"

TEST(BasicTest, BasicTest) {
  wpi::tunables::Tunable<double> value{1.0};
  wpi::tunables::Publish("value", value);
  EXPECT_EQ(static_cast<double>(value), 1.0);
}
