#include <ArduinoUniqueID.h>
#include <Ethernet.h>
#include <EthernetUdp.h>
#include <SPI.h>
//#include <OSCMessage.h>

#define NUM_OF_BOARDS 2

// defines the serial numbers of the board
uint8_t uniqId[NUM_OF_BOARDS][8] = {
  {52, 46, 49, 32, 255, 24, 14, 51},
  {52, 46, 49, 32, 255, 24, 14, 52}
  };

byte macAddr[NUM_OF_BOARDS][6] = {
  {0x2C, 0xF7, 0xF1, 0x08, 0x39, 0x7C},
  {0x2C, 0xF7, 0xF1, 0x08, 0x39, 0xD0}
  };
  
// defines the IP address corresponding to the serial number of the board
IPAddress ipAddr[NUM_OF_BOARDS] = {
  IPAddress(192, 168, 1, 41), 
  IPAddress(192, 168, 1, 42)
  };

// Not used; sum up the UniqueID and it may save some storage but we don't need that right now.
uint32_t uniqIdSum;

// The identification number of the board
int boardIndex = 255;

EthernetUDP Udp;

void setup() {
  pinMode(LED_BUILTIN, OUTPUT);
  Serial.begin(115200);
  // Delay for 2s so that serial can be fully initialised
  delay(1000);
  UniqueID8dump(Serial);
  delay(1000);
  Serial.flush();
  // Compare the serial number of the board against known serials. 
  // This will be used to set up boardIndex (for OSC) as well as the IP and MAC addresses.
  for (int i = 0; i < NUM_OF_BOARDS; i++) {
    bool matched = true;
    for (size_t j = 0; j < 8; j++) {
      if (UniqueID8[j] != uniqId[i][j]) matched = false;
    }
    if (matched) {
      Serial.print("Board matched with id ");
      Serial.println(i);
      boardIndex = i;
    }
  }
  if (boardIndex == 255) {
    Serial.println("ERROR - Unknown board.");
    blinkLED();
  }
  Serial.print("Corresponding MAC address is ");
  for (int i = 0; i < 6; i++) {
    Serial.print(macAddr[boardIndex][i], HEX);
  }
  Serial.println();
  Ethernet.begin(macAddr[boardIndex], ipAddr[boardIndex]);
  Serial.print("Corresponding IP address is ");
  Serial.println(Ethernet.localIP());
}

void loop() {
  // put your main code here, to run repeatedly:
//  Serial.println("test");
//  delay(1000);
}

// Blink the LED identified as L to show the board is not functioning as designed.
void blinkLED() {
  while(true) {
    digitalWrite(LED_BUILTIN, HIGH);
    delay(500);
    digitalWrite(LED_BUILTIN, LOW);
    delay(500);
  }
}
