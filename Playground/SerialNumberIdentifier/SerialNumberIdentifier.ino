#include <ArduinoUniqueID.h>

void setup() {
  Serial.begin(115200);
  Serial.print("test");
//  UniqueIDdump(Serial);
//  for (size_t i = 0; i < UniqueIDsize; i++) {
//    printf(UniqueID[i]);
//  }
  
//  Serial.print("UniqueID: ");
//  for (size_t i = 0; i < UniqueIDsize; i++)
//  {
//    if (UniqueID[i] < 0x10)
//      Serial.print("0");
//    Serial.print(UniqueID[i], HEX);
//    Serial.print(" ");
//  }
//  Serial.println();
}

void loop() {
  // put your main code here, to run repeatedly:

}
