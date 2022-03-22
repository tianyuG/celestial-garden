#include <ArduinoUniqueID.h>
#include <Ethernet.h>
#include <EthernetUdp.h>
#include <SPI.h>
#include <OSCMessage.h>
#include <Adafruit_MPU6050.h>
#include <Adafruit_Sensor.h>
#include <FastLED.h>
#include "hwconf.h"

FASTLED_USING_NAMESPACE

// Macros related to the LED lightstrip setups
#define LED_0_DATA 5
#define LED_0_CLK 3
#define LED_1_DATA 8
#define LED_1_CLK 9
#define LED_2_DATA 14 /*A0*/
#define LED_2_CLK 17  /*A3*/
#define LED_3_DATA 15 /*A1*/
#define LED_3_CLK 16  /*A2*/
#define LED_TYPE APA102
#define COLOR_ORDER GRB
// Number of LEDs in the lightstrip
#define NUM_LEDS 240
// Initial brightness of the lightstrip
#define INIT_BRIGHTNESS 127

// How long should the code wait before assuming serial module is initialised (milliseconds)
#define SERIAL_INIT_DELAY 5000
// How often should it send OSC message if not bumped (milliseconds)
#define SEND_OSC_EVERY_SO_OFTEN 100
#define UDP_OUT_PORT (uint16_t)8672
// The minimum value differences between averaged accelerometer readouts for
// a motion to be determined to be a major bump.
// Bump up the value if less sensitivity is desired.
#define BUMP_THRESHOLD 40
// Range for the accelerometer
#define ACCL_RANGE 1100

// Comment out the next line if diagnostic output (over serial) is not needed
// This can save around 1% -- 2% of program storage
#define DISPLAY_DIAG 1

#ifdef DISPLAY_DIAG
#define DIAG_PRINT(ARG1) Serial.print(ARG1)
#define DIAG_PRINTHEX(ARG1) Serial.print(ARG1, HEX)
#define DIAG_PRINTLN(ARG1) Serial.println(ARG1)
#else
#define DIAG_PRINT(ARG1) ((void)0)
#define DIAG_PRINTHEX(ARG1) ((void)0)
#define DIAG_PRINTLN(ARG1) ((void)0)
#endif

// Used for sendOSCStream().
enum osc_cmds
{
  x,
  y,
  xy,
  bump
};

// Variables used to determine the current and running averages of
// accelerometer readouts
const uint8_t runningAverageCount = 10;
float runningAverageBufferX[runningAverageCount];
float runningAverageBufferY[runningAverageCount];
int runningAverageAcclX = 0;
int runningAverageAcclY = 0;
uint16_t nextRunningAverage = 0;
uint16_t previousAverage = 0;
uint16_t currentAverage = 0;
uint8_t currentX = 0;
uint8_t currentY = 0;

// Counter to determine how long the program has been running.
// It will increase by 1 every 100 milliseconds.
uint32_t timeElapsed = 0;

// Index for the LED (when light is changed incrementally)
int currentIndex = 0;
// Flag to be turned on when bouy is bumped
bool isInAnimation = false;
uint8_t brightness = INIT_BRIGHTNESS;

// Array to contain the LEDS in the lightstrip
CRGBArray<NUM_LEDS> leds;
// Divide the strip into two halves
CRGBSet leds0(leds(0, NUM_LEDS / 2 - 1));
CRGBSet leds1(leds(NUM_LEDS / 2, NUM_LEDS - 1));
TBlendType currentBlending;
// CHSV startCRGB, endCRGB;

// When the bouy is motionless or relatively still,
// The two colours to pulse between.
uint8_t hue = 0;
uint8_t sat = 0;
uint8_t val = 191;
uint8_t hue0 = 0;
uint8_t sat0 = 0;
uint8_t val0 = 191;
uint8_t hue1 = 127;
uint8_t sat1 = 255;
uint8_t val1 = 127;

// The predetermined index of the board;
// The boardID is (boardIndex + 1).
uint8_t boardIndex = 127;

Adafruit_MPU6050 mpu;
EthernetUDP Udp;

void setup()
{
  // Initialise LED headers
  pinMode(LED_BUILTIN, OUTPUT);
  pinMode(LED_0_DATA, OUTPUT);
  pinMode(LED_0_CLK, OUTPUT);
  pinMode(LED_1_DATA, OUTPUT);
  pinMode(LED_1_CLK, OUTPUT);
  pinMode(LED_2_DATA, OUTPUT);
  pinMode(LED_2_CLK, OUTPUT);
  pinMode(LED_3_DATA, OUTPUT);
  pinMode(LED_3_CLK, OUTPUT);

  // Tell FastLED to initialise the lightstrip.
  FastLED.addLeds<LED_TYPE, LED_0_DATA, LED_0_CLK, COLOR_ORDER>(leds, NUM_LEDS).setCorrection(TypicalLEDStrip);
  FastLED.addLeds<LED_TYPE, LED_1_DATA, LED_1_CLK, COLOR_ORDER>(leds, NUM_LEDS).setCorrection(TypicalLEDStrip);
  FastLED.addLeds<LED_TYPE, LED_2_DATA, LED_2_CLK, COLOR_ORDER>(leds, NUM_LEDS).setCorrection(TypicalLEDStrip);
  FastLED.addLeds<LED_TYPE, LED_3_DATA, LED_3_CLK, COLOR_ORDER>(leds, NUM_LEDS).setCorrection(TypicalLEDStrip);
  currentBlending = LINEARBLEND;

  Serial.begin(115200);
  // Instead of the following code:
  // while (!Serial) delay(10);
  // Use a hardcoded time to wait until Serial is up.
  // Otherwise, the code can hang
  delay(SERIAL_INIT_DELAY);
  DIAG_PRINTLN("Serial connection established.");

  // Detect arduino board ID
  UniqueID8dump(Serial);
  // Compare the last three bytes of serial number of the board against known serials.
  // This will be used to set up boardIndex (for OSC) as well as the IP and MAC addresses.
  for (int i = 0; i < numBoards; i++)
  {
    bool matched = true;
    for (size_t j = 0; j < 3; j++)
    {
      if (UniqueID8[j + 5] != uniqId[i][j])
        matched = false;
    }
    if (matched)
    {
      boardIndex = i;
      DIAG_PRINT("Board matched at index ");
      DIAG_PRINTLN(boardIndex);
    }
  }
  // If boardIndex remains 127, it means that the board is not one of the known boards.
  if (boardIndex == 127)
  {
    DIAG_PRINTLN("ERROR - Unknown board.");
    blinkWarningLED();
  }

  // Wait for accelerometer to come online.
  if (!mpu.begin())
  {
    DIAG_PRINTLN("Waiting for accelerometer.");
    while (true)
      delay(10);
  }
  DIAG_PRINTLN("Accelerometer is online.");

  // mpu.setFilterBandwidth(MPU6050_BAND_260_HZ);

  // Change the range below to make it more or less sensitive
  mpu.setAccelerometerRange(MPU6050_RANGE_2_G);

  DIAG_PRINT("Corresponding MAC address is ");
  for (int i = 0; i < 6; i++)
  {
    DIAG_PRINTHEX(macAddr[boardIndex][i]);
    DIAG_PRINT(" ");
  }
  DIAG_PRINTLN();
  Ethernet.begin((uint8_t *)macAddr[boardIndex], ipAddr[boardIndex]);
  DIAG_PRINT("Corresponding IP address is ");
  DIAG_PRINTLN(Ethernet.localIP());
  if (Udp.begin(UDP_OUT_PORT))
  {
    DIAG_PRINTLN("Local network setup complete.");
  }
  else
  {
    DIAG_PRINTLN("ERROR - Local network setup failed.");
    blinkWarningLED();
  }

  // Turn LED lightstrip on for five seconds.
  // Use this time to inspect that all LEDs are functional.
  for (int i = 0; i < NUM_LEDS; i++)
  {
    leds[i] = CRGB(100, 100, 100);
  }
  DIAG_PRINTLN("Lightstrip will now light up for five seconds.");
  FastLED.show();
  delay(5000);
  DIAG_PRINTLN("Initial configuration is now complete.");
}

void loop()
{
  // Get accelerometer readout
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
  runningAverageBufferY[nextRunningAverage] = rawAcclY;
  if (runningAverageCount <= nextRunningAverage) nextRunningAverage = 0;
  // TODO: might change this to make the code run faster (add to buffer once every loop as opposed to adding to buffer 10 times every loop)
  // for (int i = 0; i < runningAverageCount; ++i)
  // {
    runningAverageAcclX += runningAverageBufferX[i];
    runningAverageAcclY += runningAverageBufferY[i];
  // }
  runningAverageAcclX /= runningAverageCount;
  runningAverageAcclY /= runningAverageCount;
  DIAG_PRINT(" runningAverageAcclX: ");
  DIAG_PRINT(runningAverageAcclX);
  DIAG_PRINT(" runningAverageAcclY: ");
  DIAG_PRINTLN(runningAverageAcclY);

  uint8_t scaledX = map(runningAverageAcclX, -1 * ACCL_RANGE, ACCL_RANGE, 0, 255);
  uint8_t scaledY = map(runningAverageAcclY, -1 * ACCL_RANGE, ACCL_RANGE, 0, 255);
  uint8_t diffX = abs(scaledX - 127);
  uint8_t diffY = abs(scaledY - 127);
  uint8_t rgbX = map(diffX, 0, 20, 40, 255);
  uint8_t rgbY = map(diffY, 0, 20, 40, 255);

  DIAG_PRINT(" rgbX: ");
  DIAG_PRINT(rgbX);
  DIAG_PRINT(" rgbY: ");
  DIAG_PRINTLN(rgbY);

  currentAverage = (rgbX + rgbY) / 2;
  currentX = rgbX;
  currentY = rgbY;
  DIAG_PRINT(" currentAverage: ");
  DIAG_PRINT(currentAverage);
  DIAG_PRINT(" previousAverage: ");
  DIAG_PRINTLN(previousAverage);
  DIAG_PRINT(" currentX: ");
  DIAG_PRINT(currentX);
  DIAG_PRINT(" currentY: ");
  DIAG_PRINTLN(currentY);

  brightness = beatsin8(20, 240, 255);
  hue = map(brightness, 100, 255, hue0, hue1);
  sat = map(brightness, 100, 255, sat0, sat1);
  if (!isInAnimation && timeElapsed > 50)
  {
    for (int i = 0; i < NUM_LEDS / 2; i++)
    {
      leds0[i] = CHSV(hue, sat, brightness);
      leds1[NUM_LEDS / 2 - 1 - i] = CHSV(hue, sat, brightness);

      leds0[i].r = dim8_video(leds0[i].r);
      leds0[i].g = dim8_video(leds0[i].g);
      leds0[i].b = dim8_video(leds0[i].b);
      leds1[NUM_LEDS / 2 - 1 - i].r = dim8_video(leds1[NUM_LEDS / 2 - 1 - i].r);
      leds1[NUM_LEDS / 2 - 1 - i].g = dim8_video(leds1[NUM_LEDS / 2 - 1 - i].g);
      leds1[NUM_LEDS / 2 - 1 - i].b = dim8_video(leds1[NUM_LEDS / 2 - 1 - i].b);
    }
    DIAG_PRINT("= hue ");
    DIAG_PRINT(hue);
    DIAG_PRINT(" sat ");
    DIAG_PRINT(sat);
    DIAG_PRINT(" brightness ");
    DIAG_PRINTLN(brightness);
    FastLED.show();
  }
  DIAG_PRINT(" currentIndex: ");
  DIAG_PRINTLN(currentIndex);
  DIAG_PRINT("! hue ");
  DIAG_PRINT(hue);
  DIAG_PRINT(" sat ");
  DIAG_PRINT(sat);
  DIAG_PRINT(" brightness ");
  DIAG_PRINTLN(brightness);
  if (currentIndex++ > NUM_LEDS)
  {
    isInAnimation = false;
    currentIndex = 0;
    sendOSCStream(xy, currentAverage);
    sendOSCStream(x, currentX);
    sendOSCStream(y, currentY);
  }
  else
  {
    if (abs(currentAverage - previousAverage) > BUMP_THRESHOLD)
    {
      if (isInAnimation)
        currentIndex = 0;
      isInAnimation = true;
      sendOSCStream(bump, 0);
    }
  }
  if (isInAnimation)
  {
    if (currentIndex < NUM_LEDS / 2)
    {
      leds0[currentIndex - 1] = CRGB(rgbX, 0, rgbY);
      leds1[NUM_LEDS / 2 - 1 - currentIndex - 1] = CRGB(rgbX, 0, rgbY);
      leds0[currentIndex - 1].r = dim8_video(leds0[currentIndex - 1].r);
      leds0[currentIndex - 1].g = dim8_video(leds0[currentIndex - 1].g);
      leds0[currentIndex - 1].b = dim8_video(leds0[currentIndex - 1].b);
      leds1[NUM_LEDS / 2 - 1 - currentIndex - 1].r = dim8_video(leds1[NUM_LEDS / 2 - 1 - currentIndex - 1].r);
      leds1[NUM_LEDS / 2 - 1 - currentIndex - 1].g = dim8_video(leds1[NUM_LEDS / 2 - 1 - currentIndex - 1].g);
      leds1[NUM_LEDS / 2 - 1 - currentIndex - 1].b = dim8_video(leds1[NUM_LEDS / 2 - 1 - currentIndex - 1].b);
    }
    else
    {
      leds0[currentIndex - NUM_LEDS / 2] = CHSV(hue, sat, brightness);
      leds1[NUM_LEDS - 1 - currentIndex] = CHSV(hue, sat, brightness);
      leds0[currentIndex - NUM_LEDS / 2].r = dim8_video(leds0[currentIndex - NUM_LEDS / 2].r);
      leds0[currentIndex - NUM_LEDS / 2].g = dim8_video(leds0[currentIndex - NUM_LEDS / 2].g);
      leds0[currentIndex - NUM_LEDS / 2].b = dim8_video(leds0[currentIndex - NUM_LEDS / 2].b);
      leds1[NUM_LEDS - 1 - currentIndex].r = dim8_video(leds1[NUM_LEDS - 1 - currentIndex].r);
      leds1[NUM_LEDS - 1 - currentIndex].g = dim8_video(leds1[NUM_LEDS - 1 - currentIndex].g);
      leds1[NUM_LEDS - 1 - currentIndex].b = dim8_video(leds1[NUM_LEDS - 1 - currentIndex].b);
    }

    FastLED.show();
  }

  previousAverage = currentAverage;

  EVERY_N_MILLISECONDS(SEND_OSC_EVERY_SO_OFTEN)
  {
    if (!isInAnimation)
    {
      sendOSCStream(xy, currentAverage);
      sendOSCStream(x, currentX);
      sendOSCStream(y, currentY);
    }
  }

  EVERY_N_MILLISECONDS(100)
  {
    timeElapsed++;
  }
}

/*
 * Function to format and send data over OSC.
 * axis: Use osc_x, osc_y, osc_xy or osc_bump (need to cast from `const char*` to `char*`).
 * currentVal: Value to be passed in OSC message.
 * EXAMPLE: sendOSCStream((char*) osc_bump, 10);
 */
void sendOSCStream(osc_cmds cmd, uint8_t currentVal)
{
  char boardIdent[12];
  OSCMessage msg;
  if (cmd == bump)
  {
    sprintf(boardIdent, "/bouy0%d/xy", boardIndex + 1);
    msg.add(boardIdent).add("bang");
    DIAG_PRINT(boardIdent);
    DIAG_PRINTLN(" bang");
  }
  else
  {
    switch (cmd)
    {
    case (x):
      sprintf(boardIdent, "/bouy0%d/x", boardIndex + 1);
      break;
    case (y):
      sprintf(boardIdent, "/bouy0%d/y", boardIndex + 1);
      break;
    case (xy):
      sprintf(boardIdent, "/bouy0%d/xy", boardIndex + 1);
      break;
    }
    msg.add(boardIdent).add(currentVal);
    DIAG_PRINT(boardIdent);
    DIAG_PRINT(" ");
    DIAG_PRINTLN(currentVal);
  }
  Udp.beginPacket(ipAddr[boardIndex], UDP_OUT_PORT);
  msg.send(Udp);
  Udp.endPacket();
  msg.empty();
}

// Blink the LED identified as L and halt to show the board is not functioning as designed.
void blinkWarningLED()
{
  while (true)
  {
    digitalWrite(LED_BUILTIN, HIGH);
    delay(500);
    digitalWrite(LED_BUILTIN, LOW);
    delay(500);
  }
}