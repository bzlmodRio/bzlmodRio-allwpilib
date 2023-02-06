
#include <networktables/NetworkTableValue.h>

#include "gtest/gtest.h"

TEST(BasicTest, Basic) {
  nt::Value v;
  ASSERT_EQ(NT_UNASSIGNED, v.type());
}
