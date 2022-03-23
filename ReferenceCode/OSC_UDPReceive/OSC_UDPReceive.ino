
#include <Ethernet.h>
#include <EthernetUdp.h>
#include <SPI.h>    

#include <OSCBundle.h>
#include <OSCBoards.h>

/*
* UDPReceiveOSC
* Set a tone according to incoming OSC control
*                           Adrian Freed
*/

//UDP communication


EthernetUDP Udp;
byte mac[] = {0x2C, 0xF7, 0xF1, 0x08, 0x39, 0x73}; // you can find this written on the board of some Arduino Ethernets or shields

//the Arduino's IP
IPAddress ip(192, 168, 1, 102);

//port numbers
const unsigned int inPort = 8888;

//converts the pin to an osc address
char * numToOSCAddress( int pin){
    static char s[10];
    int i = 9;
  
    s[i--]= '\0';
  do
    {
    s[i] = "0123456789"[pin % 10];
                --i;
                pin /= 10;
    }
    while(pin && i);
    s[i] = '/';
    return &s[i];
}

/**
 * TONE
 * 
 * square wave output "/tone"
 * 
 * format:
 * /tone/pin
 *   
 *   (digital value) (float value) = frequency in Hz
 *   (no value) disable tone
 * 
 **/

void routeTone(OSCMessage &msg, int addrOffset ){
  Serial.print("BANG");
}

void setup() {
  //setup ethernet part
  pinMode(LED_BUILTIN, OUTPUT);
  Ethernet.begin(mac,ip);
  Udp.begin(inPort);

}
//reads and dispatches the incoming message
void loop(){ 
    OSCBundle bundleIN;
   int size;
 
   if( (size = Udp.parsePacket())>0)
   {
     while(size--)
       bundleIN.fill(Udp.read());

      if(!bundleIN.hasError())
        bundleIN.route("/tone", routeTone);
   }
}
