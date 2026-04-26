
#include "wpi/math/geometry/Pose2d.hpp"
#include "gtest/gtest.h"

TEST(BasicTest, Basic) {
  const wpi::math::Pose2d initial{1_m, 2_m, 45_deg};
  const wpi::math::Transform2d transform{wpi::math::Translation2d{5_m, 0_m}, 5_deg};

  const auto transformed = initial + transform;

  EXPECT_DOUBLE_EQ(1.0 + 5.0 / std::sqrt(2.0), transformed.X().value());
  EXPECT_DOUBLE_EQ(2.0 + 5.0 / std::sqrt(2.0), transformed.Y().value());
  EXPECT_DOUBLE_EQ(50.0, transformed.Rotation().Degrees().value());
}
