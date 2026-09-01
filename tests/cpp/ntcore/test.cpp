
#include <wpi/nt/NetworkTableValue.hpp>

#include "gtest/gtest.h"

TEST(BasicTest, Basic) {
  wpi::nt::Value v;
  ASSERT_EQ(NT_UNASSIGNED, v.type());
}
