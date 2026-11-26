
#include "gtest/gtest.h"
#include "wpi/apriltag/AprilTagDetector.hpp"
#include "wpi/fields/Field.hpp"
#include "wpi/fields/fields.hpp"

TEST(BasicTest, Basic) {
  wpi::fields::Field field =
      wpi::fields::GetField(wpi::fields::FieldId::FRC_2022_RAPID_REACT);

  auto expectedPose =
      wpi::math::Pose3d{127.272_in, 216.01_in, 67.932_in,
                        wpi::math::Rotation3d{0_deg, 0_deg, 0_deg}};
  auto maybePose = field.GetTagPose(1);
  EXPECT_TRUE(maybePose);
  EXPECT_EQ(expectedPose, *maybePose);
}

TEST(AprilTagDetectorTest, ConfigDefaults) {
  wpi::apriltag::AprilTagDetector detector;
  auto config = detector.GetConfig();
  ASSERT_EQ(config, wpi::apriltag::AprilTagDetector::Config{});
}
