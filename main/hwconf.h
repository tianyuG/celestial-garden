#ifndef _HWCONF_H
#define _HWCONF_H

/*
 * hwconf.h - Header file for the Celestial Garden hardware configurations.
 * This file is used by the main Arduino patch  (with the help from ArduinoUniqueID library)
 * to automatically recognise the serial number of the board and assign MAC address and IP address
 * accordingly. This will allow all light pods be controlled by one single patch
 * as opposed to sixteen discrete patches.
 */

// Total number of boards that are documented
static const uint8_t numBoards = 18;

// Total number of LED lights in the lightstrip
static const uint16_t numLeds = 240;

// Last three bytes of the serial number of the Arduino board in sequence
static const uint8_t uniqId[numBoards][3] = {
    {0x17, 0x28, 0x3B},
    {0x18, 0x0E, 0x34},
    {0x17, 0x28, 0x07},
    {0x11, 0x0A, 0x15}, // Board 4
    {0x16, 0x0A, 0x3B},
    {0x15, 0x13, 0x38},
    {0x01, 0x09, 0x11},
    {0x11, 0x09, 0x38}, // Board 8
    {0x18, 0x0E, 0x0B},
    {0x14, 0x30, 0x1F},
    {0x14, 0x32, 0x1F},
    {0x17, 0x27, 0x2F}, // Board 12
    {0x12, 0x18, 0x17},
    // {0x19, 0x30, 0x2A}, // Old board 14 (inop) -> board 18
    {0x17, 0x29, 0x12}, // New board 14
    {0x15, 0x19, 0x0F},
    {0x12, 0x1A, 0x1B}, // Board 16
    {0x15, 0x12, 0x38},
    // {0x17, 0x29, 0x12} // Old board 18 -> board 14
    {0x19, 0x30, 0x2A} // New board 18
};

// Corresponding MAC addresses of each Ethernet hats
static const uint8_t macAddr[numBoards][6] = {
    {0x2C, 0xF7, 0xF1, 0x08, 0x38, 0x1C},
    {0x2C, 0xF7, 0xF1, 0x08, 0x39, 0x73},
    {0x2C, 0xF7, 0xF1, 0x08, 0x39, 0x6E},
    {0x2C, 0xF7, 0xF1, 0x08, 0x39, 0x75}, // Board 4
    {0x2C, 0xF7, 0xF1, 0x08, 0x39, 0xD8},
    {0x2C, 0xF7, 0xF1, 0x08, 0x39, 0xE7},
    {0x2C, 0xF7, 0xF1, 0x08, 0x39, 0x7C},
    {0x2C, 0xF7, 0xF1, 0x08, 0x39, 0x74}, // Board 8
    {0x2C, 0xF7, 0xF1, 0x08, 0x3E, 0xEB},
    {0x2C, 0xF7, 0xF1, 0x08, 0x3E, 0xCE},
    {0x2C, 0xF7, 0xF1, 0x08, 0x38, 0x14},
    {0x2C, 0xF7, 0xF1, 0x08, 0x38, 0x13}, // Board 12
    {0x2C, 0xF7, 0xF1, 0x08, 0x38, 0x46},
    // {0x2C, 0xF7, 0xF1, 0x08, 0x3E, 0xEA}, // Old board 14 (inop) -> board 18
    {0x2C, 0xF7, 0xF1, 0x08, 0x38, 0x53}, // New board 14
    {0x2C, 0xF7, 0xF1, 0x08, 0x39, 0xD0},
    {0x2C, 0xF7, 0xF1, 0x08, 0x38, 0x1F}, // Board 16
    {0x2C, 0xF7, 0xF1, 0x08, 0x38, 0x1E},
    // {0x2C, 0xF7, 0xF1, 0x08, 0x38, 0x53} // Old board 18 -> board 14
    {0x2C, 0xF7, 0xF1, 0x08, 0x3E, 0xEA} // New board 18
};

// Corresponding designation of IP addresses
static const IPAddress ipAddr[numBoards] = {
    IPAddress(192, 168, 1, 101), 
    IPAddress(192, 168, 1, 102), 
    IPAddress(192, 168, 1, 103), 
    IPAddress(192, 168, 1, 104), 
    IPAddress(192, 168, 1, 105), 
    IPAddress(192, 168, 1, 106), 
    IPAddress(192, 168, 1, 107), 
    IPAddress(192, 168, 1, 108), 
    IPAddress(192, 168, 1, 109), 
    IPAddress(192, 168, 1, 110), 
    IPAddress(192, 168, 1, 111), 
    IPAddress(192, 168, 1, 112), 
    IPAddress(192, 168, 1, 113), 
    IPAddress(192, 168, 1, 114), 
    IPAddress(192, 168, 1, 115), 
    IPAddress(192, 168, 1, 116), 
    IPAddress(192, 168, 1, 117), 
    IPAddress(192, 168, 1, 118) 
};

static const IPAddress outAddr(192, 168, 1, 255);
// static const IPAddress outAddr(192, 168, 1, 42);
// static const IPAddress outDiagAddr(192, 168, 1, 84);

static const unsigned int outPort = 8744;

// Default accelerometer min/max values for x- and y-axis
static const float dMinAcclX = -6.;
static const float dMaxAcclX = 6.;
static const float dMinAcclY = -6.;
static const float dMaxAcclY = 6.;

static const float bumpThreshold = 3.5;

// How many accelerometer readout will be averaged
static const uint8_t runningAverageCount = 10;

// Minimum amount of time between animations
static const unsigned long minAnimationDuration = 5000;
#endif
