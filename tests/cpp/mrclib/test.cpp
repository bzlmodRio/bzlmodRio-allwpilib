
#include "gtest/gtest.h"
#include "mrclib/ApiVersion.h"

TEST(BasicTest, Basic) { EXPECT_TRUE(MRC_CHECK_API_VERSION()); }
