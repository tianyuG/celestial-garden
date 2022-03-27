# celestial-garden

Repo for ACCelerate 2022 exhibit Celestial Garden

## Prerequisites

This project requires the following external board libraries.

- Arduino SAMD

- Adafruit SAMD
  - Requires adding `https://adafruit.github.io/arduino-board-index/package_adafruit_index.json` to _Additional Boards Manager URLs_, see [https://learn.adafruit.com/adafruit-metro-m0-express/arduino-ide-setup](https://learn.adafruit.com/adafruit-metro-m0-express/arduino-ide-setup) and [https://learn.adafruit.com/adafruit-metro-m0-express/using-with-arduino-ide](https://learn.adafruit.com/adafruit-metro-m0-express/using-with-arduino-ide).

This project requires the following external libraries.

- Adafruit MPU6050 >= 2.1.0 and dependencies: [https://github.com/adafruit/Adafruit_MPU6050](https://github.com/adafruit/Adafruit_MPU6050)

  - _Reason_: Required library for accelerometer.
  - Dependencies include both Adafruit BusIO (>= 1.11.2, [https://github.com/adafruit/Adafruit_BusIO](https://github.com/adafruit/Adafruit_BusIO)) and Adafruit Unified Sensor (>= 1.1.5, [https://github.com/adafruit/Adafruit_Sensor](https://github.com/adafruit/Adafruit_Sensor)).

- ArduinoUniqueID >= 1.2.0: [https://github.com/ricaun/ArduinoUniqueID](https://github.com/ricaun/ArduinoUniqueID)

  - _Reason_: Used to determine the board ID and automatically assign MAC and IP addresses.

- FastLED >= 3.5.0: [https://github.com/FastLED/FastLED](https://github.com/FastLED/FastLED)

  - _Reason_: Used to control LED strip.

- OSC >= 1.3.5: [https://github.com/CNMAT/OSC](https://github.com/CNMAT/OSC)

  - _Reason_: Used to send messages over local network.

- **EXPERIMENTAL** ArduinoOTA >= 1.0.8: [https://github.com/jandrassy/ArduinoOTA](https://github.com/jandrassy/ArduinoOTA)
  - _Reason_: Used to provide over-the-air firmware flashing.

This project has been tested with Arduino IDE on Windows 10.

## Usage

Ensure the data within [`hwconf.h`](main/hwconf.h) matches the hardware that will be used, ensure all prerequisites have been met, then upload [`main.ino`](main/main.ino) to the Arduino hardware using Arduino IDE.

## Terminologies

'Macro' are those lines with `#define` at the top of [`main.ino`](main/main.ino). 'Constants' are `static const` variables in [`hwconf.h`](main/hwconf.h) header file.

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
  - To determine the Arduino board serial number, upload a simple patch to Arduino and select _Tools > Get Board Info_ in Arduino IDE, and take note of the last three bytes in the sequence you see in the S/N field. For example, the S/N of `41B1592C50553158342E3120FF180E34` (currently board #2) has the last three bytes of `0x18`, `0x0E`, and `0x34`. Consequently, the MAC address (the second entry, or index 1) is `2C:F7:F1:08:39:73` (The Serial Monitor will likely not report the leading zero of `08`), and the IP address (ditto) is `192.168.1.102`.
  - If a board is not documented, the `L` LED on the Arduino board will blink red on and off every 500 milliseconds, and the code will halt.
- Arduino will wait until the accelerometer comes online and apply correct settings.
- Arduino will setup local network by using known MAC and IP addresses.
  - If local network setup fails, it will provide a warning on Serial Monitor, the `L` LED on Arduino board will blink red on and off every 500 milliseconds, and the program will halt.
- Lightstrip will come on for five seconds in white. The initial setup is complete after this.

If Arduino is connected over USB, it will provide diagnostics over Serial Monitor in Arduino IDE (if `DISPLAY_DIAG` macro is set, which is the case by default).

## OSC Messaging Formats

See [OSC_MESSAGES.md](OSC_MESSAGES.md).

## Important Macros and Files

### Macros

- `DISPLAY_DIAG`: (Set by default) Unset this macro to disable diagnostic information over serial connection.
- `ENABLE_OTA`: (Set by default) Unser this macro to disable over-the-air firmware updates.

### Files

- `main/main.ino`: Main Arduino file, firmware so to speak.
- `main/hwconf.h`: Header file for automatically configuring Arduino to set its MAC and IP address (as in hardware configuration).
- `main/otacred.h`: Header file for storing the credential for over-the-air firmware updates (as in over-the-air credential). **This file is currently in the repo as it is private. It will be removed if the repository goes public.**
