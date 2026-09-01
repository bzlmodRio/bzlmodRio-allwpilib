
#include <wpi/net/hostname.hpp>

#include "gtest/gtest.h"

TEST(HostNameTest, HostNameNotEmpty) { ASSERT_NE(wpi::net::GetHostname(), ""); }
