
#include "frc/apriltag/AprilTagDetector.h"
#include "frc/apriltag/AprilTagFieldLayout.h"
#include "gtest/gtest.h"

TEST(BasicTest, Basic) {
  frc::AprilTagFieldLayout layout =
      frc::LoadAprilTagLayoutField(frc::AprilTagField::k2022RapidReact);

  auto expectedPose = frc::Pose3d{127.272_in, 216.01_in, 67.932_in,
                                  frc::Rotation3d{0_deg, 0_deg, 0_deg}};
  auto maybePose = layout.GetTagPose(1);
  EXPECT_TRUE(maybePose);
  EXPECT_EQ(expectedPose, *maybePose);
}

TEST(AprilTagDetectorTest, ConfigDefaults) {
  frc::AprilTagDetector detector;
  auto config = detector.GetConfig();
  ASSERT_EQ(config, frc::AprilTagDetector::Config{});
}
