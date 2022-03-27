# General format of OSC messages

## General rules

- Space between parts of the messages should be interpreted as two parts of the messages, as opposed to one single message. Form the first part of the message and use `add()` of the `OSCMessage` class to add the additional parts of the message. This is needed for the Max patch to parse the message correctly.

  For example, `/pod01/x 127` should be formed by creating the `OSCMessage` object that is initialised with `/pod01/x`, and then use the `add(127)` function to add the second part of the message to the original object.

- [ID]: (`char*` as part of the string) 2-character zero-padded identification number for the Arduino board, as specified in `BOARD_IDENT.md`.

  Caveat: Use `boardIndex` (_zero-indexed_) global variable to determine the actual `[ID]` (_one-indexed_).

- `/S/` denotes the message is sent from Arduino. `/R/` denotes the message is received by Arduino.

## /S/ Messages with X- or Y-axis accelerometer data

_Handled by main `loop()`._

```
/pod[ID]/x [Data]
/pod[ID]/y [Data]
```

[Data]: (`uint8_t`) Raw accelerometer readout.

## /S/ Messages with current average of the colour value controlled by the X- and Y-axis motion

_Handled by main `loop()`._

```
/pod[ID]/xy [Data]
```

[Data]: (`uint8_t`) Averaged colour value that is controlled by both X- and Y-axis motion. RGB in the original code by David, will look into converting it to HSV.

## /S/ Messages notifying that a bump is detected

_Handled by main `loop()`._

The average values of the X- and Y-axis motion is buffered. When the previous value differs significantly from the current, it is registered as a bump and a message of the following format is sent.

```
/pod[ID]/xy bang
```

## /S/ Messages sending raw accelerometer readouts

_Handled by `sendRawAcclOSC()`._

```
/pod[ID]/acclx [Data]
/pod[ID]/accly [Data]
```

[Data]: (float) the raw readout from the accelerometer.

## /R/ Message indicating that Arduino should send the minimum and maximum values of accelerometer setup on x- and y-axis

_Handled by `parseOSCMessage()`._

```
/pod[ID]/getAcclRange
```

## /S/ Message sending minimum and maximum values of accelerometer setup on x- and y-axis

_Handled by `parseOSCMessage()`._

```
/pod[ID]/minAcclx [Data]
/pod[ID]/maxAcclx [Data]
/pod[ID]/minAccly [Data]
/pod[ID]/maxAccly [Data]
```

[Data]: (float) the minimum/maximum range set for the accelerometer.

All four messages will be sent once a `/pod[ID]/getAcclRange` is received.

## /R/ Message indicating that Arduino should perform a calibration

_Handled by `parseOSCMessage()`._

```
/pod[ID]/calibrate
/pod[ID]/resetCalibration
```

**Warning**: `/pod[ID]/calibrate` is blocking. This means that the pod will enter calibration mode for the full 20 seconds.

This needs some explanation. When server (Max/MSP) sends out `/pod[ID]/calibrate`, the specific pod will enter calibration mode (static yellow light) for 20 seconds (`CALIBRATION_DURATION` macro). What it will do is to allow someone to locate the pod, then hold the bottom of the pod and move it around. `/pod[ID]/resetCalibration` will reset the accelerometer to default value when it's not in calibration mode.

## /S/ Message indicating calibration has been reset to default value

_Handled by `parseOSCMessage()`._

```
/pod[ID]/resetComplete
```

Once `/pod[ID]/resetCalibration` is called and accelerometer range has been reset to default values, this message will be sent. This is probably necessary as there is no visual indication on if the accelerometer range has been reset.

## /R/ Message indicating that Arduino should soft reset

_Handled by `parseOSCMessage()`._

```
/pod[ID]/reboot
```

**Warning**: `/pod[ID]/reboot` is blocking. This means the pod will not function until the reboot has been complete.

The pod will blink on and off in green every 500 milliseconds for three times and then soft reboot.

## /R/ Message identifying a particular pod

_Handled by `parseOSCMessage()`._

```
/pod[ID]/ident
```

**Warning**: `/pod[ID]/ident` is blocking. This means the pod will not function for five seconds until the identification process has been complete.

The pod will blink on and off in magenta every 500 milliseconds for five times so that it can be located visually.
