
#include <wpinet/hostname.h>

#include "gtest/gtest.h"

TEST(HostNameTest, HostNameNotEmpty) { ASSERT_NE(wpi::GetHostname(), ""); }
