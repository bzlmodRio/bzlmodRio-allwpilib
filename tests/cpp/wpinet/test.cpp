
#include "gtest/gtest.h"

#include "wpinet/hostname.h"

TEST(HostNameTest, HostNameNotEmpty) {
  ASSERT_NE(wpi::GetHostname(), "");
}