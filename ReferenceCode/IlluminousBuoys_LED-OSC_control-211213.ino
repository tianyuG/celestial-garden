#include <Adafruit_NeoPixel.h>
#ifdef __AVR__
#include <avr/power.h> // Required for 16 MHz Adafruit Trinket
#endif

#define LED_PIN    (uint8_t)6
#define LED_COUNT  (uint8_t)100
#define BRIGHTNESS (uint8_t)255 // Set BRIGHTNESS to about 1/5 (max = 255)

Adafruit_NeoPixel strip(LED_COUNT, LED_PIN, NEO_RGBW + NEO_KHZ800);

#include <Wire.h>
#include <SPI.h>
#include <Adafruit_LIS3DH.h>
#include <Adafruit_Sensor.h>

#define LIS3DH_CLK (uint8_t)13
#define LIS3DH_MISO (uint8_t)12
#define LIS3DH_MOSI (uint8_t)11
#define LIS3DH_CS (uint8_t)10

Adafruit_LIS3DH lis = Adafruit_LIS3DH();

uint8_t previousAVG = 0;
uint8_t currentAVG = 0;
uint8_t currentX = 0;
uint8_t currentY = 0;

#define RunningAverageCount (uint8_t)10
float RunningAverageBufferX[RunningAverageCount];
float RunningAverageBufferY[RunningAverageCount];
uint8_t NextRunningAverage;

#include <OSCMessage.h>

/*
    Make an OSC message and send it over UDP

    Adrian Freed
*/
#include <Ethernet.h>
#include <EthernetUdp.h>
#include <SPI.h>
#include <OSCMessage.h>

EthernetUDP Udp;

//the Arduino's IP
//IPAddress ip(192, 168, 1, 201);
//IPAddress ip(192, 168, 1, 202);
IPAddress ip(192, 168, 1, 203);
//IPAddress ip(192, 168, 1, 204);

//destination IP
IPAddress outIp(192, 168, 1, 42);
#define outPort (uint16_t)8672

//byte mac[] = {0x2C, 0xF7, 0xF1, 0x08, 0x39, 0x74 }; // 192.168.1.201
//byte mac[] = {0x2C, 0xF7, 0xF1, 0x08, 0x39, 0x7C }; // 192.168.1.202
byte mac[] = {0x2C, 0xF7, 0xF1, 0x08, 0x39, 0xD0 }; // 192.168.1.203
//byte mac[] = {0x2C, 0xF7, 0xF1, 0x08, 0x39, 0x73 }; // 192.168.1.204


void setup() {

  strip.begin();           // INITIALIZE NeoPixel strip object (REQUIRED)
  strip.show();            // Turn OFF all pixels ASAP
  strip.setBrightness(BRIGHTNESS);

  Serial.begin(115200);
  while (!Serial) delay(10);     // will pause Zero, Leonardo, etc until serial console opens

  //  Serial.println("LIS3DH test!");
  //
  if (! lis.begin(0x18)) {   // change this to 0x19 for alternative i2c address
    Serial.println("Couldnt start");
    while (1) yield();
  }

  lis.setDataRate(LIS3DH_DATARATE_400_HZ);

  Ethernet.begin(mac, ip);
  Udp.begin(8672);

}

void loop() {

  lis.read();

  sensors_event_t event;
  lis.getEvent(&event);

  int RawAccx = event.acceleration.x * 100;
  int RawAccy = event.acceleration.y * 100;

  RunningAverageBufferX[NextRunningAverage++] = RawAccx;
  RunningAverageBufferY[NextRunningAverage++] = RawAccy;
  if (NextRunningAverage >= RunningAverageCount)
  {
    NextRunningAverage = 0;
  }
  int RunningAverageAccx = 0;
  int RunningAverageAccy = 0;
  for (int i = 0; i < RunningAverageCount; ++i)
  {
    RunningAverageAccx += RunningAverageBufferX[i];
    RunningAverageAccy += RunningAverageBufferY[i];
  }
  RunningAverageAccx /= RunningAverageCount;
  RunningAverageAccy /= RunningAverageCount;

  int xscaled = map(RunningAverageAccx, -1100, 1100, 0, 255);
  uint8_t xdiff = abs(xscaled - 130);
  uint8_t xrgb = map(xdiff, 0, 20, 40, 255);
  constrain(xrgb, 40, 255);

  int yscaled = map(RunningAverageAccy, -1100, 1100, 0, 255);
  uint8_t ydiff = abs(yscaled - 130);
  uint8_t yrgb = map(ydiff, 0, 20, 40, 255);
  constrain(yrgb, 40, 255);

  uint8_t xyavg = (xrgb + yrgb) / 2;

  currentAVG = xyavg;
  currentX = xrgb;
  currentY = yrgb;


  if (currentAVG - previousAVG > 13) {

    sendXYbump(); // Send 'bang' via OSC
    colorWipeUp(1);
    colorWipeDown(strip.Color(  40,   0,   40, 0), 6);
  }

  else {
    strip.fill(strip.Color(xrgb, 0, yrgb));
    strip.show();
    sendXYstream(); // Send OSC streaming data
    sendXstream();
    sendYstream();
  }

  previousAVG = currentAVG;

  delay(1);                           //  Pause for a moment

}

void sendXYbump() {
//    OSCMessage msg("/buoy01/xy");
//  OSCMessage msg("/buoy02/xy");
    OSCMessage msg("/buoy03/xy");
//    OSCMessage msg("/buoy04/xy");
  msg.add("bang");
  Udp.beginPacket(outIp, outPort);
  msg.send(Udp); // send the bytes to the SLIP stream
  Udp.endPacket(); // mark the end of the OSC Packet
  msg.empty(); // free space occupied by message

}

void sendXYstream() {
//    OSCMessage msg("/buoy01/xy");
//  OSCMessage msg("/buoy02/xy");
    OSCMessage msg("/buoy03/xy");
//    OSCMessage msg("/buoy04/xy");
  msg.add(currentAVG);
  Udp.beginPacket(outIp, outPort);
  msg.send(Udp); // send the bytes to the SLIP stream
  Udp.endPacket(); // mark the end of the OSC Packet
  msg.empty(); // free space occupied by message

}

void sendXstream() {
//    OSCMessage msg("/buoy01/x");
//  OSCMessage msg("/buoy02/x");
    OSCMessage msg("/buoy03/x");
//    OSCMessage msg("/buoy04/x");
  msg.add(currentX);
  Udp.beginPacket(outIp, outPort);
  msg.send(Udp); // send the bytes to the SLIP stream
  Udp.endPacket(); // mark the end of the OSC Packet
  msg.empty(); // free space occupied by message

}

void sendYstream() {
//    OSCMessage msg("/buoy01/y");
//  OSCMessage msg("/buoy02/y");
    OSCMessage msg("/buoy03/y");
//    OSCMessage msg("/buoy04/y");
  msg.add(currentY);
  Udp.beginPacket(outIp, outPort);
  msg.send(Udp); // send the bytes to the SLIP stream
  Udp.endPacket(); // mark the end of the OSC Packet
  msg.empty(); // free space occupied by message

}


// Fill strip pixels one after another with a color. Strip is NOT cleared
// first; anything there will be covered pixel by pixel. Pass in color
// (as a single 'packed' 32-bit value, which you can get by calling
// strip.Color(red, green, blue) as shown in the loop() function above),
// and a delay time (in milliseconds) between pixels.

void colorWipeDown(uint32_t color, int wait) {
  for (int i = 0; i < (LED_COUNT + 1); i++) { // For each pixel in strip...
    strip.setPixelColor(i, color);         //  Set pixel's color (in RAM)
    strip.show();                          //  Update strip to match
    delay(wait);                           //  Pause for a moment
  }

}

void colorWipeUp(int wait) {
  uint32_t genhsv = random(0, 65536);

  for (int i = LED_COUNT; i >= 0; i--) { // For each pixel in strip...
    strip.setPixelColor(i, strip.gamma32(strip.ColorHSV(genhsv)));        //  Set pixel's color (in RAM)
    strip.show();                          //  Update strip to match
    delay(wait);                           //  Pause for a moment
  }
}
