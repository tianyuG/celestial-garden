# General format of OSC messages
- [General format of OSC messages](#general-format-of-osc-messages)
  - [General rules](#general-rules)
  - [/S/ `x` or `y` [Data]](#s-x-or-y-data)
  - [/S/ `xy` [Data]](#s-xy-data)
  - [/S/ `bang`](#s-bang)
  - [/S/ `acclx` or `accly` [Data]](#s-acclx-or-accly-data)
  - [/R/ `getAcclRange`](#r-getacclrange)
  - [/S/ `minAcclx`, `maxAcclx`, `minAccly` and `maxAccly`](#s-minacclx-maxacclx-minaccly-and-maxaccly)
  - [/R/ `calibrate` or `resetCalibration`](#r-calibrate-or-resetcalibration)
  - [/S/ `resetComplete`](#s-resetcomplete)
  - [/R/ `reboot`](#r-reboot)
  - [/R/ `ident`](#r-ident)
  
## General rules

- Space between parts of the messages should be interpreted as two parts of the messages, as opposed to one single message. Form the first part of the message and use `add()` of the `OSCMessage` class to add the additional parts of the message. This is needed for the Max patch to parse the message correctly.

  For example, `/pod01/x 127` should be formed by creating the `OSCMessage` object that is initialised with `/pod01/x`, and then use the `add(127)` function to add the second part of the message to the original object.

- [ID]: (`char*` as part of the string) 2-character zero-padded identification number for the Arduino board, as specified in `BOARD_IDENT.md`.

  Caveat: Use `boardIndex` (_zero-indexed_) global variable to determine the actual `[ID]` (_one-indexed_).

- `/S/` denotes the message is sent from Arduino. `/R/` denotes the message is received by Arduino.

## /S/ `x` or `y` [Data]

```
/pod[ID]/x [Data]
/pod[ID]/y [Data]
```

_Handled by main `loop()`._

**Send** X- or Y-axis accelerometer data.

[Data]: (`uint8_t`) Raw accelerometer readout.

## /S/ `xy` [Data]

```
/pod[ID]/xy [Data]
```

_Handled by main `loop()`._

**Send** current average of the colour value controlled by the X- and Y-axis motion.

[Data]: (`uint8_t`) Averaged colour value that is controlled by both X- and Y-axis motion. RGB in the original code by David, will look into converting it to HSV.

## /S/ `bang`

```
/pod[ID]/xy bang
```

_Handled by main `loop()`._

**Send** to notify that a bump is detected.

The average values of the X- and Y-axis motion is buffered. When the previous value differs significantly from the current, it is registered as a bump and a message of the following format is sent.

## /S/ `acclx` or `accly` [Data]

```
/pod[ID]/acclx [Data]
/pod[ID]/accly [Data]
```

_Handled by `sendRawAcclOSC()`._

**Send** raw accelerometer readouts.

[Data]: (float) the raw readout from the accelerometer.

## /R/ `getAcclRange`

```
/pod[ID]/getAcclRange
```

_Handled by `parseOSCMessage()`._

**Receive** request to send the range (minimum and maximum values) of accelerometer setup on X- and Y-axis.

## /S/ `minAcclx`, `maxAcclx`, `minAccly` and `maxAccly`

```
/pod[ID]/minAcclx [Data]
/pod[ID]/maxAcclx [Data]
/pod[ID]/minAccly [Data]
/pod[ID]/maxAccly [Data]
```

_Handled by `parseOSCMessage()`._

**Send** range (minimum and maximum values) of accelerometer setup on X- and Y-axis.

[Data]: (float) the minimum/maximum range set for the accelerometer.

All four messages will be sent once a `/pod[ID]/getAcclRange` is received. It should be safe to assume that if one is received, the others will follow shortly (unless the packet is lost).

## /R/ `calibrate` or `resetCalibration`

```
/pod[ID]/calibrate
/pod[ID]/resetCalibration
```

_Handled by `parseOSCMessage()`._

**Receive** request to perform a calibration or reset calibration to default values.

**Warning**: `/pod[ID]/calibrate` is blocking. This means that the pod will enter calibration mode for the full 20 seconds.

This needs some explanation. When server (Max/MSP) sends out `/pod[ID]/calibrate`, the specific pod will enter calibration mode (static yellow light) for 20 seconds (`CALIBRATION_DURATION` macro). What it will do is to allow someone to locate the pod, then hold the bottom of the pod and move it around. `/pod[ID]/resetCalibration` will reset the accelerometer to default value when it's not in calibration mode.

## /S/ `resetComplete`

```
/pod[ID]/resetComplete
```

_Handled by `parseOSCMessage()`._

**Send** once the calibration is reset to default values (`dMinAcclX`, `dMaxAcclX`, `dMinAcclY`, `dMaxAcclY` in [`hwconf.h`](main/hwconf.h)).

Once `/pod[ID]/resetCalibration` is called and accelerometer range has been reset to default values, this message will be sent. This is probably necessary as there is no visual indication on if the accelerometer range has been reset.

## /R/ `reboot`

```
/pod[ID]/reboot
```

_Handled by `parseOSCMessage()`._

**Receive** request for a soft reboot.

**Warning**: `/pod[ID]/reboot` is blocking. This means the pod will not function until the reboot has been complete.

**Intended Behaviour**: The pod will blink on and off in green every 500 milliseconds for three times and then soft reboot.

## /R/ `ident`

```
/pod[ID]/ident
```

_Handled by `parseOSCMessage()`._

**Receive** request to identify the pod with a particular ID.

**Warning**: `/pod[ID]/ident` is blocking. This means the pod will not function for five seconds until the identification process has been complete.

**Intended Behaviour**: The corresponding pod will blink on and off in magenta every 500 milliseconds for five times so that it can be located visually.
