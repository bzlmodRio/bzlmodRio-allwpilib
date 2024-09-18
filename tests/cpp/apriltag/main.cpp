
#include <iostream>

#include "frc/apriltag/AprilTagFieldLayout.h"

int main() {
  frc::AprilTagFieldLayout layout =
      frc::AprilTagFieldLayout::LoadField(frc::AprilTagField::k2022RapidReact);
  std::cout << "Loaded field!" << std::endl;
  return 0;
}
