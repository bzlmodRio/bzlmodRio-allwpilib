
#include <iostream>

#include "wpi/fields/Field.hpp"
#include "wpi/fields/fields.hpp"

int main() {
  wpi::fields::Field field =
      wpi::fields::GetField(wpi::fields::FieldId::FRC_2022_RAPID_REACT);
  std::cout << "Loaded field!" << std::endl;
  return 0;
}
