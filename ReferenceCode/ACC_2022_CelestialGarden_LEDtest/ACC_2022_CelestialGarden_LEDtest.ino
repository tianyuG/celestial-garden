#include <FastLED.h>

FASTLED_USING_NAMESPACE

#define LED_HEARTBEAT 6
#define LED_0_DATA  5
#define LED_0_CLK   3
#define LED_1_DATA  8
#define LED_1_CLK   9
#define LED_2_DATA  14  /*A0*/
#define LED_2_CLK   17  /*A3*/
#define LED_3_DATA  15  /*A1*/
#define LED_3_CLK   16  /*A2*/

#define SENSOR_PIN  A4

#define LED_TYPE    APA102
#define COLOR_ORDER GRB
#define NUM_LEDS    240
//CRGB leds[NUM_LEDS];
CRGBArray<NUM_LEDS> leds;
#define BRIGHTNESS          100
#define FRAMES_PER_SECOND  120


void rainbow(void);
void rainbowWithGlitter(void);
void confetti(void);
void sinelon(void);
void juggle(void);
void bpm(void);

// List of patterns to cycle through.  Each is defined as a separate function below.
typedef void (*SimplePatternList[])();
SimplePatternList gPatterns = { rainbow, bpm };

uint8_t gCurrentPatternNumber = 0; // Index number of which pattern is current
uint8_t gHue = 0; // rotating "base color" used by many of the patterns

uint8_t heartBeatState = 0;
uint32_t heartBeatLastMillis = 0;
uint32_t heartBeatDurations[4] = {200, 100, 200, 500}; //sum to 1000ms for 60 bpm

CRGBPalette16 currentPalette;
TBlendType    currentBlending;

extern CRGBPalette16 myRedWhiteBluePalette;
extern const TProgmemPalette16 myRedWhiteBluePalette_p PROGMEM;

void setup() {
  delay(3000); // 1 second delay for recovery
  Serial.begin(115200);
  for(int i=3;i>=0;i--){
    Serial.println(i,DEC);
    delay(1000);
  }
   
  
  pinMode(LED_HEARTBEAT,OUTPUT);
  digitalWrite(LED_HEARTBEAT,heartBeatState%2);//turn on the heartbeat LED

  pinMode(LED_0_DATA,OUTPUT);
  pinMode(LED_0_CLK,OUTPUT);
  pinMode(LED_1_DATA,OUTPUT);
  pinMode(LED_1_CLK,OUTPUT);
  pinMode(LED_2_DATA,OUTPUT);
  pinMode(LED_2_CLK,OUTPUT);
  pinMode(LED_3_DATA,OUTPUT);
  pinMode(LED_3_CLK,OUTPUT);

  pinMode(SENSOR_PIN,INPUT);

  // tell FastLED about the LED strip configuration
  //FastLED.addLeds<LED_TYPE,DATA_PIN,COLOR_ORDER>(leds, NUM_LEDS).setCorrection(TypicalLEDStrip);
  FastLED.addLeds<LED_TYPE,LED_0_DATA,LED_0_CLK,COLOR_ORDER>(leds, NUM_LEDS).setCorrection(TypicalLEDStrip);
  FastLED.addLeds<LED_TYPE,LED_1_DATA,LED_1_CLK,COLOR_ORDER>(leds, NUM_LEDS).setCorrection(TypicalLEDStrip);
  FastLED.addLeds<LED_TYPE,LED_2_DATA,LED_2_CLK,COLOR_ORDER>(leds, NUM_LEDS).setCorrection(TypicalLEDStrip);
  FastLED.addLeds<LED_TYPE,LED_3_DATA,LED_3_CLK,COLOR_ORDER>(leds, NUM_LEDS).setCorrection(TypicalLEDStrip);

  // set master brightness control
  FastLED.setBrightness(BRIGHTNESS);

   currentPalette = RainbowColors_p;
   currentBlending = LINEARBLEND;
}

void loop(){ 
  static uint8_t hue;
  for(int i = 0; i < NUM_LEDS/2; i++) {   
    // fade everything out
    leds.fadeToBlackBy(40);

    // let's set an led value
    leds[i] = CHSV(hue++,255,255);

    // now, let's first 20 leds to the top 20 leds, 
    leds(NUM_LEDS/2,NUM_LEDS-1) = leds(NUM_LEDS/2 - 1 ,0);
    FastLED.delay(33);
  }
}
