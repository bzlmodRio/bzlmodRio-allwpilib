
#include "gtest/gtest.h"
#include "wpi/cs/HttpCamera.hpp"

class CameraSourceTest : public ::testing::Test {
 protected:
  CameraSourceTest() = default;
};

TEST_F(CameraSourceTest, Basictest) {
  auto source = wpi::cs::HttpCamera("axis", "http://localhost:8000");
  wpi::cs::Shutdown();
}
