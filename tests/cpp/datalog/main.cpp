
#include <iostream>
#include <wpi/datalog/DataLogReader.hpp>

int main() {
  wpi::log::DataLogRecord record;
  std::cout << record.GetEntry() << std::endl;
  return 0;
}
