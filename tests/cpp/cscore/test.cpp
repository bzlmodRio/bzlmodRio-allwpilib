
#include <cscore.h>

#include "gtest/gtest.h"

class CameraSourceTest : public ::testing::Test {
 protected:
  CameraSourceTest() = default;
};

TEST_F(CameraSourceTest, Basictest) {
  auto source = cs::HttpCamera("axis", "http://localhost:8000");
  // cs::Shutdown();
}
