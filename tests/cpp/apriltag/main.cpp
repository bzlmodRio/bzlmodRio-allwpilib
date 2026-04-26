
#include <iostream>

#include "wpi/apriltag/AprilTagFieldLayout.hpp"

int main() {
  wpi::apriltag::AprilTagFieldLayout layout =
      wpi::apriltag::AprilTagFieldLayout::LoadField(wpi::apriltag::AprilTagField::k2022RapidReact);
  std::cout << "Loaded field!" << std::endl;
  return 0;
}
