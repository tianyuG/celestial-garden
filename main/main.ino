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

// Comment out the next line if OSC is not needed (in testing)
//#define ENABLE_OSC 1

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

#define FASTLED_SHOW_CORE 1

// Version of this current script
const char version[10] = "01APR-01";

#define LED_0_DATA 5
#define LED_0_CLK 3
#define LED_1_DATA 8
#define LED_1_CLK 9
#define LED_2_DATA 14 /*A0*/
#define LED_2_CLK 17  /*A3*/
#define LED_3_DATA 15 /*A1*/
#define LED_3_CLK 16  /*A2*/
#define LED_TYPE APA102
#define COLOR_ORDER BGR
// Initial brightness of the lightstrip.
#define INIT_BRIGHTNESS 255
// How long should the code wait before assuming serial module is initialised (milliseconds)
#define SERIAL_INIT_DELAY 5000
// How many LEDs should be turned on per cycle
#define IDLING_LIGHTS_PER_CYCLE 120
#define ANIMATION_LIGHTS_PER_CYCLE 120
// How long should Arduino remain in calibration mode (milliseconds)
#define CALIBRATION_DURATION 20000
// How fast FastLED is going to update the lightstrip
//#define FRAMES_PER_SECOND 480

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
float buffDiffX[runningAverageCount];
float buffDiffY[runningAverageCount];
uint8_t bufferIndex = 0;
float previousBufferAverage = 0;
float currentBufferAverage = 0;
uint8_t currentX = 0;
uint8_t currentY = 0;
// Index for the LED (when light is changed incrementally)
int bumpAnimationIndex = numLeds - 1;
// Index for the LED (when the light pulses)
int idleAnimationIndex = numLeds - 1;
bool isInAnimation = false;
float brightness = INIT_BRIGHTNESS;
// Name used by OSC to route message
char oscRouteName[6];
// Maximum and minimum values from the accelerometer in x- and y-axis
float minAcclX = dMinAcclX;
float maxAcclX = dMaxAcclX;
float minAcclY = dMinAcclY;
float maxAcclY = dMaxAcclY;
// If the pod is in calibration mode
// bool isInCalibration = false;
uint16_t scaledX = 0;
uint16_t scaledY = 0;
float deltaX = 0.;
float deltaY = 0.;
float accl[2];
float rollingAverageAcclX = 0;
float rollingAverageAcclY = 0;
bool needsFadeIn = false;

// CRGBArray<numLeds> leds;
CRGB leds[numLeds];
CRGB ghostLeds[numLeds];
// CRGBSet leds_t(leds(0, numLeds - numBttmLeds - 1));
// CRGBSet leds_b(leds(numLeds - numBttmLeds, numLeds - 1));
//  CRGBPalette16 currentPalette;
//  //  Two halves of the led strip
//  CRGBSet leds0(leds(0, numLeds / 2 - 1));
//  CRGBSet leds1(leds(numLeds / 2, numLeds - 1));
TBlendType currentBlending;
// CHSV startCRGB, endCRGB;
uint8_t hue = 0;
uint8_t sat = 0;
float val = 191.;
// Two of the colours to pulse between
uint8_t hue0 = 20;
uint8_t sat0 = 20;
float val0 = 191;
uint8_t hue1 = 127;
uint8_t sat1 = 255;
float val1 = 127;
// Bump HSV
uint8_t hue_b = 0;
uint8_t sat_b = 0;
float val_b = 0.;
// uint8_t minHue = 0;
// uint8_t maxHue = 255;
// uint8_t minSat = 0;
// uint8_t maxSat = 255;
// uint8_t minVal = 0;
// uint8_t maxVal = 255;
// uint8_t hueB[blendCount];
// uint8_t satB[blendCount];
// float valB[blendCount];
// CHSV top_start, top_end, bottom_start, bottom_end;

// The identification number of the board
uint8_t boardIndex = 127;

//
unsigned long animationTimer;

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

  FastLED.addLeds<LED_TYPE, LED_0_DATA, LED_0_CLK, COLOR_ORDER, DATA_RATE_MHZ(10)>(leds, numLeds).setCorrection(TypicalLEDStrip);
  FastLED.addLeds<LED_TYPE, LED_1_DATA, LED_1_CLK, COLOR_ORDER, DATA_RATE_MHZ(10)>(leds, numLeds).setCorrection(TypicalLEDStrip);
  FastLED.addLeds<LED_TYPE, LED_2_DATA, LED_2_CLK, COLOR_ORDER, DATA_RATE_MHZ(10)>(leds, numLeds).setCorrection(TypicalLEDStrip);
  FastLED.addLeds<LED_TYPE, LED_3_DATA, LED_3_CLK, COLOR_ORDER, DATA_RATE_MHZ(10)>(leds, numLeds).setCorrection(TypicalLEDStrip);
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
      sprintf(oscRouteName, "/pod%02d", boardIndex + 1);
      //      sprintf(oscRouteName, "/pod%d", boardIndex + 1);
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
#ifdef ENABLE_OSC
  for (int i = 0; i < numLeds; i++)
  {
    leds[i] = CRGB(100, 100, 100);
  }
  DIAG_PRINTLN("Lightstrip will now light up for five seconds.");
  FastLED.show();
  delay(5000);
#endif
  animationTimer = millis();
  FastLED.setDither(1);
  DIAG_PRINTLN("Initial configuration is now complete.");
}

void loop()
{
//  EVERY_N_MILLISECONDS(20)
//  {
#ifdef ENABLE_OTA
  ArduinoOTA.poll();
#endif
#ifdef ENABLE_OSC
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
#endif

  pollAccl();
  //        DIAG_PRINT("scaledX: ");
  //      DIAG_PRINT(scaledX);
  //      DIAG_PRINT(" scaledY: ");
  //      DIAG_PRINTLN(scaledY);
  updateIdleHSV();

  if (abs(deltaX) + abs(deltaY) > bumpThreshold && millis() - animationTimer > animationTimeout)
  {
    pollAccl();
    isInAnimation = true;
    for (int i = numLeds; i > 4; --i)
    {
      for (int j = 0; j < 6; j++)
      {
        updateBumpHSV();
        if (i > 0)
        {
          DIAG_PRINT(" hue_b ");
          DIAG_PRINT(hue_b);
          DIAG_PRINT(" sat_b ");
          DIAG_PRINT(sat_b);
          DIAG_PRINT(" val_b ");
          DIAG_PRINTLN(val_b);
          leds[j == 5 ? i : i--] = CHSV(hue_b, sat_b, val_b);
        }
      }

      FastLED.show();
    }
    for (int i = 0; i < numLeds - 4; i++)
    {
      for (int j = 0; j < 6; j++)
      {
        pollAccl();
        updateIdleHSV();
        if (i > 0)
        {
          if (i > numLeds - numBttmLeds && i < numLeds - 1)
          {
            leds[i] = getBlendedHSV(CHSV(hue, constrain(sat * 0.8, 80, 225), constrain(val - 50, 50, 150)), CHSV(constrain(hue * 1.1, 80, 220), constrain(sat * 0.8, 40, 200), constrain(val - 40, 50, 150)), j == 5 ? i : i++);
          }
          else
          {
            leds[i] = getBlendedHSV(CHSV(hue, constrain(sat * 1.5, 40, 200), val + 20), CHSV(hue - boardIndex, constrain(sat * 1.5, 40, 200) + boardIndex, val + 10), j == 5 ? i : i++);
          }
          //          leds[j == 5 ? i : i++] = CHSV(hue, constrain(sat * 0.8, 40, 200), i > numLeds - numBttmLeds ? val : val - 50);
        }
      }

      FastLED.show();
    }
    animationTimer = millis();
    isInAnimation = false;
  }
  if (!isInAnimation)
  {
    pollAccl();
    updateIdleHSV();
    for (int i = numLeds - 1; i >= numLeds - numBttmLeds; i--)
    {
      leds[i] = getBlendedHSV(CHSV(abs((uint8_t)~hue - 60), sat, val), CHSV(abs((uint8_t)~hue - 50), sat, val), i);
    }
    for (int i = numLeds - numBttmLeds - 1; i >= 0; i--)
    {
      leds[i] = getBlendedHSV(CHSV(hue, constrain(sat * 1.2, 40, 180), val * 0.8), CHSV(hue - boardIndex, constrain(sat * 1.25, 40, 180) + boardIndex, val * 0.9), i);
    }
    FastLED.show();

    //    fill_gradient(leds, 0, CHSV(hue, constrain(sat * 0.8, 40, 200), constrain(val - 50, 50, 150)), numLeds - numBttmLeds - 1, CHSV(constrain(hue * 0.9, 40, 200) + boardIndex, constrain(sat * 0.8, 40, 200) - boardIndex, constrain(val - 40, 50, 150)), SHORTEST_HUES);
    //    fill_gradient(leds, numLeds - numBttmLeds, CHSV(hue, constrain(sat * 1.5, 40, 230), val + 20), numLeds - 1, CHSV(hue - boardIndex, constrain(sat * 1.5, 40, 230) + boardIndex, val + 10), BACKWARD_HUES);

    FastLED.show();
  }
  //}
}

/*
 * Function to format and send data over OSC.
 * cmds: (enum osc_cmds) Use x, y, xy or bump.
 * currentVal: (uint8_t) Value to be passed in OSC message.
 * EXAMPLE: sendOSCStream(bump, 10);
 */
void sendOSCStream(osc_cmds cmd, uint8_t currentVal)
{
#ifdef ENABLE_OSC
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
  if (cmd == bump)
  {
    msg.add("bang");
  }
  else
  {
    msg.add(currentVal);
  }
  Udp.beginPacket(outAddr, outPort);
  msg.send(Udp);
  Udp.endPacket();
  msg.empty();
#endif
}

/*
 * Function to send raw accelerometer readout over OSC.
 * cmd: (enum osc_cmds) Use x or y.
 * currentVal: (float) Value to be passed in OSC message.
 * EXAMPLE: sendRawAcclOSC(x, 0.01);
 */
void sendRawAcclOSC(osc_cmds cmd, float currentVal)
{
#ifdef ENABLE_OSC
  char boardIdent[18];
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
#endif
}

void sendAnyOSC(String msgBody)
{
#ifdef ENABLE_OSC
  char boardIdent[12];
  sprintf(boardIdent, "%s/any", oscRouteName);
  OSCMessage msg(boardIdent);
  msg.add(msgBody);
  Udp.beginPacket(outAddr, outPort);
  msg.send(Udp);
  Udp.endPacket();
  msg.empty();
#endif
}

/*
 * Function to parse OSC message that is sent to Arduino.
 * See `../OSC_MESSAGES.md` for documentation (sections that starts with '(R)').
 */
void parseOSCMessage(OSCMessage &msg, int offset)
{
#ifdef ENABLE_OSC
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
  }
  else if (msg.fullMatch("/ping", offset))
  {
    char boardIdent[12];
    sprintf(boardIdent, "%s/ping", oscRouteName);
    OSCMessage response(boardIdent);
    Udp.beginPacket(outAddr, outPort);
    response.send(Udp);
    Udp.endPacket();
    response.empty();
  }
  else if (msg.fullMatch("/version", offset))
  {
    char boardIdent[24];
    sprintf(boardIdent, "%s/version", oscRouteName);
    OSCMessage response(boardIdent);
    response.add(version);
    Udp.beginPacket(outAddr, outPort);
    response.send(Udp);
    Udp.endPacket();
    response.empty();
  }
#endif
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

/*
 * Get Accelerometer reading
 */
void pollAccl()
{
  sensors_event_t accle, gyros, tempe;
  mpu.getEvent(&accle, &gyros, &tempe);
  accl[0] = accle.acceleration.x;
  accl[1] = accle.acceleration.y;

  // Use a buffer to calculate rolling average for accelerometer readouts
  rollingAverageBufferX[bufferIndex] = accl[0];
  rollingAverageBufferY[bufferIndex] = accl[1];
  if (++bufferIndex >= runningAverageCount)
    bufferIndex = 0;

  for (int i = 0; i < runningAverageCount; ++i)
  {
    rollingAverageAcclX += rollingAverageBufferX[i];
    rollingAverageAcclY += rollingAverageBufferY[i];
  }
  //    DIAG_PRINT("= rollingAverageBufferX: ");
  //    for (int i = 0; i < runningAverageCount; i++){
  //      DIAG_PRINT(rollingAverageBufferX[i]);
  //      DIAG_PRINT(" ");
  //    }
  //    DIAG_PRINTLN(" ");
  rollingAverageAcclX /= (float)runningAverageCount;
  rollingAverageAcclY /= (float)runningAverageCount;
  deltaX = accl[0] - rollingAverageAcclX;
  deltaY = accl[1] - rollingAverageAcclY;
  //    DIAG_PRINT("- rollingAverageAcclX: ");
  //    DIAG_PRINT(rollingAverageAcclX);
  //    DIAG_PRINT(" rollingAverageAcclY: ");
  //    DIAG_PRINTLN(rollingAverageAcclY);
  //  DIAG_PRINT("deltaX: ");
  //  DIAG_PRINT(deltaX);
  //  DIAG_PRINT(" deltaY: ");
  //  DIAG_PRINTLN(deltaY);

  scaledX = constrain(map(rollingAverageAcclX, minAcclX, maxAcclX, 160, 255), 160, 255);
  scaledY = constrain(map(rollingAverageAcclY, minAcclY, maxAcclY, 160, 255), 160, 255);

#ifdef ENABLE_OSC
  sendRawAcclOSC(x, accl[0]);
  sendRawAcclOSC(y, accl[1]);
  sendOSCStream(x, scaledX);
  sendOSCStream(y, scaledY);
  sendOSCStream(xy, (scaledX + scaledY) / 2);
#endif
}

void updateIdleHSV()
{
  unsigned long timeVariation = ((millis() / 250) + 22) % 23;
  uint16_t boardVariation = (boardIndex * 27) % 21;
  hue = beatsin8(2, 30, 120) + boardVariation + map(scaledY - 30, 160, 255, hue0, hue1);
  sat = beatsin8(3, 20, 120) - boardVariation + map(scaledX - 30, 160, 255, hue0, hue1);
  val = (float)beatsin16(2, 0, 15300) / 256. + 80.;
  // val = 200;

  //   DIAG_PRINT(" HUE ");
  //   DIAG_PRINT(hue);
  //   DIAG_PRINT(" SAT ");
  //   DIAG_PRINT(sat);
  //   DIAG_PRINT(" VAL ");
  //   DIAG_PRINTLN(val);
}

void updateBumpHSV()
{
  hue_b = constrain((uint8_t)(140 | (uint8_t)~hue) + deltaY * 10, 80, 200) + (millis() / 500) % 23;
  sat_b = constrain((uint8_t)(110 | (uint8_t)~sat) + deltaX * 10, 80, 200) + (millis() / 500) % 19;
  val_b = (float)beatsin16(2, 0, 15300) / 256. + 80.;
  // val_b = 200;

  //  DIAG_PRINT(" HUE_b ");
  //  DIAG_PRINT(hue);
  //  DIAG_PRINT(" SAT_b ");
  //  DIAG_PRINT(sat);
  //  DIAG_PRINT(" VAL_b ");
  //  DIAG_PRINTLN(val);
}

CHSV getBlendedHSV(CHSV startC, CHSV endC, int index)
{
  CHSV ret = blend(startC, endC, (float)index * 255. / (float)(numLeds - 1));
  //     DIAG_PRINT(" HUE ");
  //   DIAG_PRINT(ret.hue);
  //   DIAG_PRINT(" SAT ");
  //   DIAG_PRINT(ret.sat);
  //   DIAG_PRINT(" VAL ");
  //   DIAG_PRINTLN(ret.val);

  return ret;
}
