#include <ArduinoUniqueID.h>
#include <Ethernet.h>
#include <EthernetUdp.h>
#include <SPI.h>
#include <OSCMessage.h>
#include <Adafruit_MPU6050.h>
#include <Adafruit_Sensor.h>
#include <FastLED.h>

FASTLED_USING_NAMESPACE

#define NUM_OF_BOARDS 3
#define UDP_OUT_PORT (uint16_t)8672
#define BUMP_THRESHOLD 13
#define LED_0_DATA  5
#define LED_0_CLK   3
#define LED_1_DATA  8
#define LED_1_CLK   9
#define LED_2_DATA  14  /*A0*/
#define LED_2_CLK   17  /*A3*/
#define LED_3_DATA  15  /*A1*/
#define LED_3_CLK   16  /*A2*/
#define LED_TYPE    APA102
#define COLOR_ORDER GRB
#define NUM_LEDS    240
#define BRIGHTNESS  100
#define FRAMES_PER_SECOND  120

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

const uint8_t runningAverageCount = 10;
float runningAverageBufferX[runningAverageCount];
float runningAverageBufferY[runningAverageCount];
uint8_t nextRunningAverage = 0;
uint8_t previousAverage = 0;
uint8_t currentAverage = 0;
uint8_t currentX = 0;
uint8_t currentY = 0;

CRGB leds[NUM_LEDS];

// defines the serial numbers of the board
const uint8_t uniqId[NUM_OF_BOARDS][8] = {
  {52, 46, 49, 32, 255, 24, 14, 51},
  {52, 46, 49, 32, 255, 24, 14, 52}, 
  {0x34, 0x2E, 0x31, 0x20, 0xFF, 0x17, 0x28, 0x3B}
  };

const uint8_t macAddr[NUM_OF_BOARDS][6] = {
  {0x2C, 0xF7, 0xF1, 0x08, 0x39, 0x7C},
  {0x2C, 0xF7, 0xF1, 0x08, 0x39, 0xD0},
  {0x2C, 0xF7, 0xF1, 0x08, 0x39, 0xD1}
  };
  
// defines the IP address corresponding to the serial number of the board
const IPAddress ipAddr[NUM_OF_BOARDS] = {
  IPAddress(192, 168, 1, 41), 
  IPAddress(192, 168, 1, 42),
  IPAddress(192, 168, 1, 43)
  };

// Not used; sum up the UniqueID and it may save some storage but we don't need that right now.
// uint32_t uniqIdSum;

// The identification number of the board
uint8_t boardIndex = 127;

Adafruit_MPU6050 mpu;
EthernetUDP Udp;

void setup() {
  pinMode(LED_BUILTIN, OUTPUT);
  pinMode(LED_0_DATA,OUTPUT);
  pinMode(LED_0_CLK,OUTPUT);
  pinMode(LED_1_DATA,OUTPUT);
  pinMode(LED_1_CLK,OUTPUT);
  pinMode(LED_2_DATA,OUTPUT);
  pinMode(LED_2_CLK,OUTPUT);
  pinMode(LED_3_DATA,OUTPUT);
  pinMode(LED_3_CLK,OUTPUT);

  FastLED.addLeds<LED_TYPE,LED_0_DATA,LED_0_CLK,COLOR_ORDER>(leds, NUM_LEDS).setCorrection(TypicalLEDStrip);
  FastLED.addLeds<LED_TYPE,LED_1_DATA,LED_1_CLK,COLOR_ORDER>(leds, NUM_LEDS).setCorrection(TypicalLEDStrip);
  FastLED.addLeds<LED_TYPE,LED_2_DATA,LED_2_CLK,COLOR_ORDER>(leds, NUM_LEDS).setCorrection(TypicalLEDStrip);
  FastLED.addLeds<LED_TYPE,LED_3_DATA,LED_3_CLK,COLOR_ORDER>(leds, NUM_LEDS).setCorrection(TypicalLEDStrip);

  Serial.begin(115200);
  // Delay for 0.01s until serial is fully initialised
  while (!Serial) delay(10);
  Serial.flush();
  DIAG_PRINTLN("Serial connection established.");

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
      DIAG_PRINT("Board matched at index ");
      DIAG_PRINTLN(i);
      boardIndex = i;
    }
  }
  // If boardIndex remains the same, it means that the board is not one of the known boards.
  if (boardIndex == 127) {
    DIAG_PRINTLN("ERROR - Unknown board.");
    blinkLED();
  }

  if (!mpu.begin()) {
    DIAG_PRINTLN("Waiting for accelerometer.");
    while (true) delay(10);
  }
  DIAG_PRINTLN("Accelerometer is online.");

  mpu.setFilterBandwidth(MPU6050_BAND_260_HZ);

  // Change the range below to make it more or less sensitive
  mpu.setAccelerometerRange(MPU6050_RANGE_4_G);

  DIAG_PRINT("Corresponding MAC address is ");
  for (int i = 0; i < 6; i++) {
    DIAG_PRINTHEX(macAddr[boardIndex][i]);
    DIAG_PRINT(" ");
  }
  DIAG_PRINTLN();
  Ethernet.begin((uint8_t*) macAddr[boardIndex], ipAddr[boardIndex]);
  DIAG_PRINT("Corresponding IP address is ");
  DIAG_PRINTLN(Ethernet.localIP());
  Udp.begin(UDP_OUT_PORT);
}

void loop() {
  // put your main code here, to run repeatedly:
//  Serial.println("test");
//  delay(1000);

  sensors_event_t accl, gyro, temp;
  mpu.getEvent(&accl, &gyro, &temp);
  // DIAG_PRINT("Acceleration X: ");
  // DIAG_PRINT(accl.acceleration.x);
  // DIAG_PRINT(", Y: ");
  // DIAG_PRINT(accl.acceleration.y);
  // DIAG_PRINT(", Z: ");
  // DIAG_PRINT(accl.acceleration.z);
  // DIAG_PRINTLN(" m/s^2");

  int rawAcclX = accl.acceleration.x * 100;
  int rawAcclY = accl.acceleration.y * 100;

//  DIAG_PRINT("rawAcclX: ");
//  DIAG_PRINT(rawAcclX);
//  DIAG_PRINT(" rawAcclY: ");
//  DIAG_PRINTLN(rawAcclY);

  runningAverageBufferX[nextRunningAverage++] = rawAcclX;
  runningAverageBufferY[nextRunningAverage++] = rawAcclY;
  if (nextRunningAverage >= runningAverageCount)
  {
    nextRunningAverage = 0;
  }
  int runningAverageAcclX = 0;
  int runningAverageAcclY = 0;
  for (int i = 0; i < runningAverageCount; ++i)
  {
    runningAverageAcclX += runningAverageBufferX[i];
    runningAverageAcclY += runningAverageBufferY[i];
  }
  runningAverageAcclX /= runningAverageCount;
  runningAverageAcclY /= runningAverageCount;
  DIAG_PRINT("runningAverageAcclX: ");
  DIAG_PRINT(runningAverageAcclX);
  DIAG_PRINT(" runningAverageAcclY: ");
  DIAG_PRINTLN(runningAverageAcclY);

  uint8_t scaledX = map(runningAverageAcclX, -1100, 1100, 0, 255);
  uint8_t scaledY = map(runningAverageAcclY, -1100, 1100, 0, 255);
  uint8_t diffX = abs(scaledX - 127);
  uint8_t diffY = abs(scaledY - 127);

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
  Udp.beginPacket(ipAddr[boardIndex], UDP_OUT_PORT);
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
