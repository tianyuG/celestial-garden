#include <ArduinoUniqueID.h>
#include <Ethernet.h>
#include <EthernetUdp.h>
#include <SPI.h>
#include <OSCMessage.h>

#define NUM_OF_BOARDS 2
#define OUT_PORT (uint16_t)8672

// Comment out the next line if diagnostic output (over serial) is not needed
// This can save around 1% -- 2% of program storage
#define DISPLAY_DIAG 1

#ifdef DISPLAY_DIAG
  #define DIAG_PRINT(ARG1) Serial.print(ARG1)
  #define DIAG_PRINTHEX(ARG1) Serial.print(ARG1, HEX)
  #define DIAG_PRINTLN(ARG1) Serial.println(ARG1)
#else
  #define DIAG_PRINT(ARG1) ((void) 0)
  #define DIAG_PRINTHEX(ARG1) ((void) 0)
  #define DIAG_PRINTLN(ARG1) ((void) 0)
#endif

// Used for sendOSCStream().
const char osc_x[] = "x";
const char osc_y[] = "y";
const char osc_xy[] = "xy";
const char osc_bump[] = "bump";

// defines the serial numbers of the board
const uint8_t uniqId[NUM_OF_BOARDS][8] = {
  {52, 46, 49, 32, 255, 24, 14, 51},
  {52, 46, 49, 32, 255, 24, 14, 52}
  };

const uint8_t macAddr[NUM_OF_BOARDS][6] = {
  {0x2C, 0xF7, 0xF1, 0x08, 0x39, 0x7C},
  {0x2C, 0xF7, 0xF1, 0x08, 0x39, 0xD0}
  };
  
// defines the IP address corresponding to the serial number of the board
const IPAddress ipAddr[NUM_OF_BOARDS] = {
  IPAddress(192, 168, 1, 41), 
  IPAddress(192, 168, 1, 42)
  };

// Not used; sum up the UniqueID and it may save some storage but we don't need that right now.
// uint32_t uniqIdSum;

// The identification number of the board
uint8_t boardIndex = 127;

EthernetUDP Udp;

void setup() {
  pinMode(LED_BUILTIN, OUTPUT);
  Serial.begin(115200);
  // Delay for 0.01s until serial is fully initialised
  while (!Serial) delay(10);
  Serial.flush();

  // Detect arduino board ID
  UniqueID8dump(Serial);
  // Compare the serial number of the board against known serials. 
  // This will be used to set up boardIndex (for OSC) as well as the IP and MAC addresses.
  for (int i = 0; i < NUM_OF_BOARDS; i++) {
    bool matched = true;
    for (size_t j = 0; j < 8; j++) {
      if (UniqueID8[j] != uniqId[i][j]) matched = false;
    }
    if (matched) {
      DIAG_PRINT("Board matched with id ");
      DIAG_PRINTLN(i);
      boardIndex = i;
    }
  }
  // If boardIndex remains the same, it means that the board is not one of the known boards.
  if (boardIndex == 127) {
    DIAG_PRINTLN("ERROR - Unknown board.");
    blinkLED();
  }
  DIAG_PRINT("Corresponding MAC address is ");
  for (int i = 0; i < 6; i++) {
    DIAG_PRINTHEX(macAddr[boardIndex][i]);
  }
  DIAG_PRINTLN();
  Ethernet.begin((uint8_t*) macAddr[boardIndex], ipAddr[boardIndex]);
  DIAG_PRINT("Corresponding IP address is ");
  DIAG_PRINTLN(Ethernet.localIP());
  Udp.begin(OUT_PORT);
}

void loop() {
  // put your main code here, to run repeatedly:
//  Serial.println("test");
//  delay(1000);
}

/*
 * Function to format and send data over OSC.
 * axis: Use osc_x, osc_y, osc_xy or oxy_bump (need to cast from `const char*` to `char*`).
 * currentVal: Value to be passed in OSC message.
 * EXAMPLE: sendOSCStream((char*) osc_bump, 10);
 */
void sendOSCStream(char* axis, uint8_t currentVal) {
  char boardIdent[12];
  OSCMessage msg;
  if (strncmp(osc_bump, axis, 4) == 0) {
    sprintf(boardIdent, "/bouy0%d/xy", boardIndex + 1);
    msg.add(boardIdent).add("bang");
  } else {
    sprintf(boardIdent, "/bouy0%d/%s", boardIndex + 1, axis);
    msg.add(boardIdent).add(currentVal);
  }
  Udp.beginPacket(ipAddr[boardIndex], OUT_PORT);
  msg.send(Udp);
  Udp.endPacket();
  msg.empty();
}

// Blink the LED identified as L and halt to show the board is not functioning as designed.
void blinkLED() {
  while(true) {
    digitalWrite(LED_BUILTIN, HIGH);
    delay(500);
    digitalWrite(LED_BUILTIN, LOW);
    delay(500);
  }
}
