
#include <iostream>

#include "gtest/gtest.h"

TEST(BasicTest, Basic) {
  std::cout << "Not easily testable" << std::endl;
  EXPECT_TRUE(true);
}
