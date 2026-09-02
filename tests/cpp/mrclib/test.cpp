
#include "gtest/gtest.h"
#include "mrclib/ApiVersion.h"

TEST(BasicTest, BasicTest) {
  EXPECT_TRUE(MRC_CHECK_API_VERSION());
}
