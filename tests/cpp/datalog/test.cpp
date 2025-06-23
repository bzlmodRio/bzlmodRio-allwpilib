
#include <wpi/datalog/DataLogReader.h>

#include "gtest/gtest.h"

TEST(BasicTest, Basic) {
  wpi::log::DataLogRecord record;
  EXPECT_EQ(-1, record.GetEntry());
}
