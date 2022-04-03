# celestial-garden

Arduino firmware for ACCelerate 2022 exhibit [Celestial Garden](https://acceleratefestival.com/exhibits/celestial-garden/) ([archived](https://web.archive.org/web/20220327211602/https://acceleratefestival.com/exhibits/celestial-garden/)).

> _Main code and documentation (c) 2022 Tianyu Ge, with portions of code adapted from works by [David Franusich](./ReferenceCode/IlluminousBuoys_LED-OSC_control-211213/IlluminousBuoys_LED-OSC_control-211213.ino), [Matthew Swarts](ReferenceCode/ACC_2022_CelestialGarden_LEDtest/ACC_2022_CelestialGarden_LEDtest.ino), and [Adrian](ReferenceCode/OSC_UDPReceive/OSC_UDPReceive.ino) [Freed](ReferenceCode/UDPSendMessage-220324.ino)._

- [celestial-garden](#celestial-garden)
  - [Prerequisites](#prerequisites)
  - [Usage](#usage)
    - [Over-the-Air (OTA) Firmware Update](#over-the-air-ota-firmware-update)
  - [Terminologies](#terminologies)
  - [Bootup Sequence](#bootup-sequence)
  - [Known Issues](#known-issues)
  - [OSC Messaging Formats](#osc-messaging-formats)
  - [Miscellaneous Documentation](#miscellaneous-documentation)

## Prerequisites

The Arduino firmware requires the following external board libraries.

- Arduino SAMD

- Adafruit SAMD
  - Requires adding `https://adafruit.github.io/arduino-board-index/package_adafruit_index.json` to _Additional Boards Manager URLs_, see [https://learn.adafruit.com/adafruit-metro-m0-express/arduino-ide-setup](https://learn.adafruit.com/adafruit-metro-m0-express/arduino-ide-setup) and [https://learn.adafruit.com/adafruit-metro-m0-express/using-with-arduino-ide](https://learn.adafruit.com/adafruit-metro-m0-express/using-with-arduino-ide).

The Arduino firmware requires the following external libraries.

- [Adafruit MPU6050](https://github.com/adafruit/Adafruit_MPU6050) >= 2.1.0 and dependencies

  - _Reason_: Required library for accelerometer.
  - Dependencies include both [Adafruit BusIO](https://github.com/adafruit/Adafruit_BusIO) (>= 1.11.2) and [Adafruit Unified Sensor](https://github.com/adafruit/Adafruit_Sensor) (>= 1.1.5).

- [ArduinoUniqueID](https://github.com/ricaun/ArduinoUniqueID) >= 1.2.0

  - _Reason_: Used to determine the board ID and automatically assign MAC and IP addresses.

- [FastLED](https://github.com/FastLED/FastLED) >= 3.5.0;

  - _Reason_: Used to control LED strip.

- [OSC](https://github.com/CNMAT/OSC) >= 1.3.5;

  - _Reason_: Used to send messages over local network.

- **EXPERIMENTAL** [ArduinoOTA](https://github.com/jandrassy/ArduinoOTA) >= 1.0.8.

  - _Reason_: Used to provide over-the-air firmware flashing.

The diagnostics [Max](https://cycling74.com/products/max) patcher requires the following packages:

- [CNMAT External](https://cnmat.berkeley.edu/downloads) >= 1.0.4.

  - _Reason_: To allow better OSC communication.

  - Does not currently support [computers using Apple silicon](https://support.apple.com/en-us/HT211814). Beta version of CMNAT External ([v. 1.0.4c](https://github.com/CNMAT/CNMAT-Externs/releases/tag/v1.0.4c)) should be compatible.

The Arduino firmware has been tested with Arduino IDE on Windows 10. The diagnostics patcher has been tested with Max 8.2.2 on Windows 10.

## Usage

Ensure the data within [`hwconf.h`](main/hwconf.h) matches the hardware that will be used, ensure all prerequisites have been met, then upload [`main.ino`](main/main.ino) to the Arduino hardware using Arduino IDE.

### Over-the-Air (OTA) Firmware Update

_This is currently an experimental feature and can be disabled by unsetting the `ENABLE_OTA` macro._

The preferred way to update the firmware is by using USB connection, but over-the-air firmware update can also be done on a computer that is directly connected to the switch. Wait until Arduino is fully boot up (when the lightstrip turns all white), and select the correct Arduino board in _Tools > Port_. In addition to normal Serial ports section (if one is connected), there will be a Network ports section. Select the correct board and upload firmware.

If you have difficulties identifying the board, you can use the [`/pod[ID]/ident` OSC Message](OSC_MESSAGES.md#r-ident).

## Terminologies

'Macro' are those lines with `#define` at the top of [`main.ino`](main/main.ino). 'Constants' are `static const` variables in [`hwconf.h`](main/hwconf.h) header file.

'Soft reboot' is a process where a reboot is initiated from software, or when power temporarily disconnects. 'Hard reboot' is a process where power is lost for an extended amount of time so that the RAM data is no longer retained.

Each individual assembled hardware components (Arduino + Ethernet hat + custom designed board + speaker + fabric) is known as a 'pod'.

## Bootup Sequence

If the correct Arduino patch is uploaded to the board, the LED strip is receiving correct amount of power, and the Arduino is being powered, it will attempt to do the following:

- FastLED library will set up the lightstrips. Arduino will attempt to initialise serial connection and wait for five seconds.
  - The length of the delay is controlled by the `SERIAL_INIT_DELAY` macro in the main Arduino patch. The unit of this marco is milliseconds.
  - If serial connection fails to establish, it will still move on to the next steps. However, it will likely not to function, as the ArduinoUniqueID library will require serial library to function.
  - During the time when Arduino initially boot up and the five seconds waiting period, the pod will either remain turned off if the Arduino comes from a fresh boot and the lightstrip is connected to power before Arduino, or remain on momentarily and be turned off if Arduino is power cycled while the lightstrip remains in power (soft reboot).
- From a list of known Arduino board serial numbers, Arduino will determine what MAC address and IP address it should use.
  - The list of known serial numbers and corresponding MAC and IP addresses are in [`hwconf.h`](main/hwconf.h). In usage, the arrays are zero-indexed.
  - The original list of known serial numbers and corresponding MAC and IP addresses are in [`BOARD_IDENT.csv`](BOARD_IDENT.csv). In usage, the list is one-indexed.
  - Only the last three bytes of the Arduino board serial number are needed.
  - To determine the Arduino board serial number, upload a simple patch to Arduino and select _Tools > Get Board Info_ in Arduino IDE, and take note of the last three bytes in the sequence you see in the S/N field. For example, the S/N of `41B1592C50553158342E3120FF180E34` (currently board 2) has the last three bytes of `0x18`, `0x0E`, and `0x34`. Consequently, the MAC address (the second entry, or index 1) is `2C:F7:F1:08:39:73` (The Serial Monitor will likely not report the leading zero of `08`), and the IP address (ditto) is `192.168.1.102`.
  - If a board is not documented, the `L` LED on the Arduino board will blink red on and off every 500 milliseconds, and the code will halt.
- Arduino will wait until the accelerometer comes online and apply correct settings.
- Arduino will setup local network by using known MAC and IP addresses.
  - If local network setup fails, it will provide a warning on Serial Monitor, the `L` LED on Arduino board will blink red on and off every 500 milliseconds, and the program will halt.
- Arduino will initialise over-the-air firmware update module is `ENABLE_OTA` macro is set (it is set by default).
- Lightstrip will come on for five seconds in white. The initial setup is complete after this.

If Arduino is connected over USB, it will provide diagnostics over Serial Monitor in Arduino IDE (if `DISPLAY_DIAG` macro is set, which is the case by default).

## Known Issues

See [KNOWN_ISSUES.md](KNOWN_ISSUES.md).

## OSC Messaging Formats

See [OSC_MESSAGES.md](OSC_MESSAGES.md).

## Miscellaneous Documentation

- Descriptions on what the macros do: [MACROS_DESC.md](MACROS_DESC.md);
  
- Descriptions on what the files do: [FILES_DESC.md](FILES_DESC.md).
