#include <ArduinoUniqueID.h>
#include <Ethernet.h>
#include <EthernetUdp.h>
#include <SPI.h>
#include <OSCMessage.h>
#include <OSCBundle.h>
#include <Adafruit_MPU6050.h>
#include <Adafruit_Sensor.h>
#include <FastLED.h>
#include "hwconf.h"
#include "otacred.h"

// Comment out the next line if diagnostic output (over serial) is not needed.
// This can save around 1% -- 2% of program storage.
#define DISPLAY_DIAG 1

// Comment out the next line if over-the-air update is not desirable
#define ENABLE_OTA 1

#ifdef DISPLAY_DIAG
#define DIAG_PRINT(ARG1) Serial.print(ARG1)
#define DIAG_PRINTHEX(ARG1) Serial.print(ARG1, HEX)
#define DIAG_PRINTLN(ARG1) Serial.println(ARG1)
#else
#define DIAG_PRINT(ARG1) ((void)0)
#define DIAG_PRINTHEX(ARG1) ((void)0)
#define DIAG_PRINTLN(ARG1) ((void)0)
#endif

#ifdef ENABLE_OTA
#include <ArduinoOTA.h>
#endif

FASTLED_USING_NAMESPACE

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
// Initial brightness of the lightstrip.
#define INIT_BRIGHTNESS 255
// How long should the code wait before assuming serial module is initialised (milliseconds)
#define SERIAL_INIT_DELAY 5000
// How many LEDs should be turned on per cycle
#define LIGHTS_PER_CYCLE 3
// The threshold for a motion to be determined to be a bump
#define BUMP_THRESHOLD 10
// How long should Arduino remain in calibration mode (milliseconds)
#define CALIBRATION_DURATION 20000

// Used for sendOSCStream().
enum osc_cmds
{
  x,
  y,
  xy,
  bump
};

float rollingAverageBufferX[runningAverageCount];
float rollingAverageBufferY[runningAverageCount];
uint8_t bufferIndex = 0;
float previousBufferAverage = 0;
float currentBufferAverage = 0;
uint8_t currentX = 0;
uint8_t currentY = 0;
// Index for the LED (when light is changed incrementally)
int bumpAnimationIndex = numLeds - 1;
// Index for the LED (when the light pulses)
int idleAnimationIndex = 0;
bool isInAnimation = false;
float brightness = INIT_BRIGHTNESS;
// Fade up or down (1 or -1);
uint8_t fade_direction = 1;
// Name used by OSC to route message
char oscRouteName[6];
// Maximum and minimum values from the accelerometer in x- and y-axis
float minAcclX = dMinAcclX;
float maxAcclX = dMaxAcclX;
float minAcclY = dMinAcclY;
float maxAcclY = dMaxAcclY;
// If the pod is in calibration mode
// bool isInCalibration = false;

CRGBArray<numLeds> leds;
// CRGBPalette16 currentPalette;
//  Two halves of the led strip
CRGBSet leds0(leds(0, numLeds / 2 - 1));
CRGBSet leds1(leds(numLeds / 2, numLeds - 1));
TBlendType currentBlending;
// CHSV startCRGB, endCRGB;
uint8_t hue = 0;
uint8_t sat = 0;
uint8_t val = 191;
// Two of the colours to pulse between
uint8_t hue0 = 0;
uint8_t sat0 = 0;
uint8_t val0 = 191;
uint8_t hue1 = 127;
uint8_t sat1 = 255;
uint8_t val1 = 127;
uint8_t minHue = 0;
uint8_t maxHue = 255;
uint8_t minSat = 0;
uint8_t maxSat = 255;
uint8_t minVal = 0;
uint8_t maxVal = 255;

// The identification number of the board
uint8_t boardIndex = 127;

Adafruit_MPU6050 mpu;
EthernetUDP Udp;

void setup()
{
  pinMode(LED_BUILTIN, OUTPUT);
  pinMode(LED_0_DATA, OUTPUT);
  pinMode(LED_0_CLK, OUTPUT);
  pinMode(LED_1_DATA, OUTPUT);
  pinMode(LED_1_CLK, OUTPUT);
  pinMode(LED_2_DATA, OUTPUT);
  pinMode(LED_2_CLK, OUTPUT);
  pinMode(LED_3_DATA, OUTPUT);
  pinMode(LED_3_CLK, OUTPUT);

  FastLED.addLeds<LED_TYPE, LED_0_DATA, LED_0_CLK, COLOR_ORDER>(leds, numLeds).setCorrection(TypicalLEDStrip);
  FastLED.addLeds<LED_TYPE, LED_1_DATA, LED_1_CLK, COLOR_ORDER>(leds, numLeds).setCorrection(TypicalLEDStrip);
  FastLED.addLeds<LED_TYPE, LED_2_DATA, LED_2_CLK, COLOR_ORDER>(leds, numLeds).setCorrection(TypicalLEDStrip);
  FastLED.addLeds<LED_TYPE, LED_3_DATA, LED_3_CLK, COLOR_ORDER>(leds, numLeds).setCorrection(TypicalLEDStrip);
  currentBlending = LINEARBLEND;
  FastLED.clear();
  FastLED.show();

  Serial.begin(115200);
  // Instead of the following code:
  // while (!Serial) delay(10);
  // Use a hardcoded time to wait until Serial is up.
  // Otherwise, the code can hang
  delay(SERIAL_INIT_DELAY);
  DIAG_PRINTLN("Serial connection established.");

  // Detect arduino board ID
  UniqueID8dump(Serial);
  // Compare the serial number of the board against known serials.
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
      sprintf(oscRouteName, "/pod0%d", boardIndex + 1);
    }
  }
  // If boardIndex remains the same, it means that the board is not one of the known boards.
  if (boardIndex == 127)
  {
    DIAG_PRINTLN("ERROR - Unknown board.");
    blinkWarningLED();
  }

  if (!mpu.begin())
  {
    DIAG_PRINTLN("Waiting for accelerometer.");
    while (true)
      delay(10);
  }
  DIAG_PRINTLN("Accelerometer is online.");

  mpu.setFilterBandwidth(MPU6050_BAND_260_HZ);

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

  sendLocalAddrOSC();

  // Udp.begin(outPort);
  if (Udp.begin(outPort))
  {
    DIAG_PRINTLN("Local network setup complete.");
  }
  else
  {
    DIAG_PRINTLN("ERROR - Local network setup failed.");
    blinkWarningLED();
  }

#ifdef ENABLE_OTA
  ArduinoOTA.begin(Ethernet.localIP(), otaUser, otaPass, InternalStorage);
  DIAG_PRINTLN("Arduino OTA module has been initialised.");
#endif

  for (int i = 0; i < numLeds; i++)
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
#ifdef ENABLE_OTA
  ArduinoOTA.poll();
#endif
  OSCBundle msgIn;
  int msgSize;
  if ((msgSize = Udp.parsePacket()) > 0)
  {
    while (msgSize--)
    {
      msgIn.fill(Udp.read());
      if (!msgIn.hasError())
        msgIn.route(oscRouteName, parseOSCMessage);
    }
  }

  sensors_event_t accl, gyro, temp;
  mpu.getEvent(&accl, &gyro, &temp);

  float rawAcclX = accl.acceleration.x;
  float rawAcclY = accl.acceleration.y;

  // Send raw accelerometer data over OSC
  sendRawAcclOSC(x, rawAcclX);
  sendRawAcclOSC(y, rawAcclY);

  // Use a buffer to calculate rolling average for accelerometer readouts
  rollingAverageBufferX[bufferIndex] = rawAcclX;
  rollingAverageBufferY[bufferIndex++] = rawAcclY;
  if (runningAverageCount <= bufferIndex)
    bufferIndex = 0;
  float rollingAverageAcclX = 0;
  float rollingAverageAcclY = 0;
  for (int i = 0; i < runningAverageCount; ++i)
  {
    rollingAverageAcclX += rollingAverageBufferX[i];
    rollingAverageAcclY += rollingAverageBufferY[i];
  }
  rollingAverageAcclX /= (float)runningAverageCount;
  rollingAverageAcclY /= (float)runningAverageCount;

  float diffX = abs(rollingAverageAcclX / (maxAcclX - minAcclX) * 255 - 127);
  float diffY = abs(rollingAverageAcclY / (maxAcclY - minAcclY) * 255 - 127);
  float rgbX = map((int)diffX, 0, 20, 40, 255);
  float rgbY = map((int)diffY, 0, 20, 40, 255);

  currentBufferAverage = (rgbX + rgbY) / 2;
  currentX = rgbX;
  currentY = rgbY;

  sendOSCStream(xy, currentBufferAverage);
  sendOSCStream(x, currentX);
  sendOSCStream(y, currentY);

  brightness = (float)beatsin16(20, 240, 255) / 256. - (diffX + diffY) / 4;
  hue = map(brightness, 100, 255, hue0, hue1) + (diffX + diffY) / 4;
  sat = map(brightness, 100, 255, sat0, sat1) - (diffX + diffY) / 4;
  val = brightness;

  DIAG_PRINT(" HUE ");
  DIAG_PRINT(hue);
  DIAG_PRINT(" SAT ");
  DIAG_PRINT(sat);
  DIAG_PRINT(" VAL ");
  DIAG_PRINTLN(val);

  // Idle animation
  if (!isInAnimation)
  {
    for (int i = 0; i < numLeds; i++) {
      leds[i] = CHSV(hue, sat, val);
      leds[i].r = dim8_video(leds[i].r);
      leds[i].g = dim8_video(leds[i].g);
      leds[i].b = dim8_video(leds[i].b);
      leds.setBrightness(brightness);
      sendOSCStream(xy, currentBufferAverage);
      sendOSCStream(x, currentX);
      sendOSCStream(y, currentY);
      sendAnyOSC("idle " + i);
    }
//     if (idleAnimationIndex >= numLeds)
//       idleAnimationIndex = 0;
//     for (int i = idleAnimationIndex; (i + LIGHTS_PER_CYCLE < numLeds ? i < i + LIGHTS_PER_CYCLE : i < numLeds) ; i++) {
//       leds[idleAnimationIndex] = CHSV(hue, sat, val);
//       leds[idleAnimationIndex].r = dim8_video(leds[idleAnimationIndex].r);
//       leds[idleAnimationIndex].g = dim8_video(leds[idleAnimationIndex].g);
//       leds[idleAnimationIndex].b = dim8_video(leds[idleAnimationIndex].b);
//       sendOSCStream(xy, currentBufferAverage);
// //      sendOSCStream(x, currentX);
// //      sendOSCStream(y, currentY);
//     }
//     idleAnimationIndex += LIGHTS_PER_CYCLE;
    FastLED.show();
  }
  // To make sure that bumpAnimationIndex wraps back to (numLeds - 1) when the last LED has been lit
  if (bumpAnimationIndex < 0)
  {
    isInAnimation = false;
    bumpAnimationIndex = numLeds - 1;
    sendOSCStream(xy, currentBufferAverage);
//    sendOSCStream(x, currentX);
//    sendOSCStream(y, currentY);
  }
  else
  {
    // If a bump is detected, prep for bump animation
    if (abs(currentBufferAverage - previousBufferAverage) > BUMP_THRESHOLD)
    {
      // If bumped when bump animation is already in place,
      // Restart bump animation counter.
      if (isInAnimation)
        bumpAnimationIndex = numLeds - 1;
      isInAnimation = true;
      sendOSCStream(bump, 0);
    }
  }
  if (isInAnimation)
  {
    for (int i = 0; i < LIGHTS_PER_CYCLE; i++)
    {
      if (--bumpAnimationIndex < 0)
      {
        bumpAnimationIndex = numLeds - 1;
        isInAnimation = false;
      }

      leds[bumpAnimationIndex] = CRGB(rgbX, rgbY, 0);
      //      DIAG_PRINT(">>>> bumpAnimationIndex: ");
      //      DIAG_PRINTLN(bumpAnimationIndex);
      leds[bumpAnimationIndex - 1].r = dim8_video(leds[bumpAnimationIndex - 1].r);
      leds[bumpAnimationIndex - 1].g = dim8_video(leds[bumpAnimationIndex - 1].g);
      leds[bumpAnimationIndex - 1].b = dim8_video(leds[bumpAnimationIndex - 1].b);
      sendOSCStream(xy, currentBufferAverage);
//      sendOSCStream(x, currentX);
//      sendOSCStream(y, currentY);
      FastLED.show();
    }
  }

  previousBufferAverage = currentBufferAverage;
}

/*
 * Function to format and send data over OSC.
 * cmds: (enum osc_cmds) Use x, y, xy or bump.
 * currentVal: (uint8_t) Value to be passed in OSC message.
 * EXAMPLE: sendOSCStream(bump, 10);
 */
void sendOSCStream(osc_cmds cmd, uint8_t currentVal)
{
  char boardIdent[12];
  switch (cmd)
  {
  case (x):
    sprintf(boardIdent, "%s/x", oscRouteName);
    break;
  case (y):
    sprintf(boardIdent, "%s/y", oscRouteName);
    break;
  case (xy):
    sprintf(boardIdent, "%s/xy", oscRouteName);
    break;
  case (bump):
    sprintf(boardIdent, "%s/xy", oscRouteName);
    break;
  }
  DIAG_PRINT(boardIdent);
  DIAG_PRINT(" ");
  DIAG_PRINTLN(currentVal);

  OSCMessage msg(boardIdent);
  (cmd == bump) ? msg.add("bang") : msg.add(currentVal);
  Udp.beginPacket(outAddr, outPort);
  msg.send(Udp);
  Udp.endPacket();
  msg.empty();
}

/*
 * Function to send raw accelerometer readout over OSC.
 * cmd: (enum osc_cmds) Use x or y.
 * currentVal: (float) Value to be passed in OSC message.
 * EXAMPLE: sendRawAcclOSC(x, 0.01);
 */
void sendRawAcclOSC(osc_cmds cmd, float currentVal)
{
  char boardIdent[12];
  switch (cmd)
  {
  case (x):
    sprintf(boardIdent, "%s/accl_x", oscRouteName);
    break;
  case (y):
    sprintf(boardIdent, "%s/accl_y", oscRouteName);
    break;
  }
  OSCMessage msg(boardIdent);
  msg.add(currentVal);
  Udp.beginPacket(outAddr, outPort);
  msg.send(Udp);
  Udp.endPacket();
  msg.empty();
}

/*
 * Function to send local IP address to server over OSC
 */
void sendLocalAddrOSC() {
//  char boardIdent[12];
//  sprintf(boardIdent, "%s/my_ip", oscRouteName);
//  OSCMessage msg(boardIdent);
//  IPAddress myIP = Ethernet.localIP();
//  char myIPAddr[16];
//  sprintf(myIPAddr, "%s:%s:%s:%s", String(myIP[0]), String(myIP[1]), String(myIP[2]), String(myIP[3]));
//  msg.add(myIPAddr);
//  Udp.beginPacket(outAddr, outPort);
//  msg.send(Udp);
//  Udp.endPacket();
//  msg.empty();
}

void sendAnyOSC(String msgBody) {
  char boardIdent[12];
  sprintf(boardIdent, "%s/any", oscRouteName);
  OSCMessage msg(boardIdent);
  msg.add(msgBody);
  Udp.beginPacket(outAddr, outPort);
  msg.send(Udp);
  Udp.endPacket();
  msg.empty();
}

/*
 * Function to parse OSC message that is sent to Arduino.
 * See `../OSC_MESSAGES.md` for documentation (sections that starts with '(R)').
 */
void parseOSCMessage(OSCMessage &msg, int offset)
{
  if (msg.fullMatch("/reboot", offset))
  {
    for (int i = 0; i < 3; i++)
    {
      FastLED.setBrightness(127);
      fill_solid(leds, numLeds, CRGB(0, 255, 0));
      FastLED.show();
      delay(500);
      FastLED.clear();
      FastLED.show();
      delay(500);
    }
    NVIC_SystemReset();
  }
  else if (msg.fullMatch("/reset_calibration", offset))
  {
    char boardIdent[24];
    FastLED.clear();
    FastLED.show();
    minAcclX = dMinAcclX;
    maxAcclX = dMaxAcclX;
    minAcclY = dMinAcclY;
    maxAcclY = dMaxAcclY;
    
    sprintf(boardIdent, "%s/reset_complete", oscRouteName);
    OSCMessage response(boardIdent);
    Udp.beginPacket(outAddr, outPort);
    response.send(Udp);
    Udp.endPacket();
    response.empty();
    delay(500);
  }
  else if (msg.fullMatch("/ident", offset))
  {
    DIAG_PRINTLN("OSC-IDENT received");
    FastLED.setBrightness(191);
    for (int i = 0; i < 3; i++)
    {
      fill_solid(leds, numLeds, CRGB(255, 0, 127));
      FastLED.show();
      delay(500);
      FastLED.clear();
      FastLED.show();
      delay(500);
      DIAG_PRINTLN("OSC-IDENT looped");
    }
  }
  else if (msg.fullMatch("/get_accl_range", offset))
  {
    OSCBundle response;
    char boardIdentMinX[24], boardIdentMaxX[24], boardIdentMinY[24], boardIdentMaxY[24];
    sprintf(boardIdentMinX, "%s/min_accl_x", oscRouteName);
    sprintf(boardIdentMaxX, "%s/max_accl_x", oscRouteName);
    sprintf(boardIdentMinY, "%s/min_accl_y", oscRouteName);
    sprintf(boardIdentMaxY, "%s/max_accl_y", oscRouteName);
    response.add(boardIdentMinX).add(minAcclX);
    response.add(boardIdentMaxX).add(maxAcclX);
    response.add(boardIdentMinY).add(minAcclY);
    response.add(boardIdentMaxY).add(maxAcclY);
    Udp.beginPacket(outAddr, outPort);
    response.send(Udp);
    Udp.endPacket();
    response.empty();
  }
  else if (msg.fullMatch("/calibrate", offset))
  {
    unsigned long startTime = millis();
    FastLED.setBrightness(127);
    fill_solid(leds, numLeds, CRGB(255, 255, 0));
    FastLED.show();
    
    while (millis() - startTime < CALIBRATION_DURATION)
    {
      sensors_event_t accl, gyro, temp;
      mpu.getEvent(&accl, &gyro, &temp);
      if (accl.acceleration.x < minAcclX)
        minAcclX = accl.acceleration.x;
      if (accl.acceleration.x > maxAcclX)
        maxAcclX = accl.acceleration.x;
      if (accl.acceleration.y < minAcclY)
        minAcclY = accl.acceleration.y;
      if (accl.acceleration.y > maxAcclY)
        maxAcclY = accl.acceleration.y;
    }
    FastLED.clear();
    FastLED.show();
    delay(1000);
  } else if (msg.fullMatch("/ping", offset)) {
    char boardIdent[12];
    sprintf("%s/ping", oscRouteName);
    OSCMessage response(boardIdent);
    Udp.beginPacket(outAddr, outPort);
    response.send(Udp);
    Udp.endPacket();
    response.empty();
  }
}
/*
 * Function to perform calibration
 */

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
