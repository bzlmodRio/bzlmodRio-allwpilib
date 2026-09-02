
#include "gtest/gtest.h"
#include "wpi/fields/Field.hpp"
#include "wpi/fields/fields.hpp"

TEST(BasicTest, BasicTest) {
  wpi::fields::Field field =
      wpi::fields::GetField(wpi::fields::FieldId::FRC_2022_RAPID_REACT);
  EXPECT_FALSE(field.GetName().empty());
}
