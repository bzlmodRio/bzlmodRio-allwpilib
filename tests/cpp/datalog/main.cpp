
#include <wpi/datalog/DataLogReader.hpp>

#include <iostream>

int main() {
  wpi::log::DataLogRecord record;
  std::cout << record.GetEntry() << std::endl;
  return 0;
}
