
#include "gtest/gtest.h"
#include "wpi/telemetry/Telemetry.hpp"

TEST(BasicTest, Basic) { EXPECT_NO_THROW(wpi::telemetry::Log("value", 42.0)); }
