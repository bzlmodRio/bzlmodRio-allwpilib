
#include <iostream>

#include "frc/apriltag/AprilTagFieldLayout.h"

int main() {
  frc::AprilTagFieldLayout layout =
      frc::LoadAprilTagLayoutField(frc::AprilTagField::k2022RapidReact);
  std::cout << "Loaded field!" << std::endl;
  return 0;
}
