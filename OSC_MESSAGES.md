# General format of OSC messages

- [General format of OSC messages](#general-format-of-osc-messages)
  - [General rules](#general-rules)
  - [(S) `x` or `y` [Data]](#s-x-or-y-data)
  - [(S) `xy` [Data]](#s-xy-data)
  - [(S) `bang`](#s-bang)
  - [(S) `acclx` or `accly` [Data]](#s-acclx-or-accly-data)
  - [(R) `getAcclRange`](#r-getacclrange)
  - [(S) `minAcclx`, `maxAcclx`, `minAccly` and `maxAccly`](#s-minacclx-maxacclx-minaccly-and-maxaccly)
  - [(R) `calibrate`](#r-calibrate)
  - [(R) `resetCalibration`](#r-resetcalibration)
  - [(S) `resetComplete`](#s-resetcomplete)
  - [(R) `reboot`](#r-reboot)
  - [(R) `ident`](#r-ident)
  
## General rules

- Space between parts of the messages should be interpreted as two parts of the messages, as opposed to one single message. Form the first part of the message and use `add()` of the `OSCMessage` class to add the additional parts of the message. This is needed for the Max patch to parse the message correctly.

  For example, `/pod01/x 127` should be formed by creating the `OSCMessage` object that is initialised with `/pod01/x`, and then use the `add(127)` function to add the second part of the message to the original object.

- [ID]: (`char*` as part of the string) 2-character zero-padded identification number for the Arduino board, as specified in `BOARD_IDENT.md`.

  Caveat: Use `boardIndex` (_zero-indexed_) global variable to determine the actual `[ID]` (_one-indexed_).

- The messages are directional. '(S)' prefix denotes the message will be sent from Arduino. '(R)' prefix denotes the message received by Arduino needs to conform to this format in order to be recognised.

## (S) `x` or `y` [Data]

```
/pod[ID]/x [Data]
/pod[ID]/y [Data]
```

_Handled by main `loop()`._

**Sends** X- or Y-axis accelerometer data.

[Data]: (`uint8_t`) Raw accelerometer readout.

## (S) `xy` [Data]

```
/pod[ID]/xy [Data]
```

_Handled by main `loop()`._

**Sends** current average of the colour value controlled by the X- and Y-axis motion.

[Data]: (`uint8_t`) Averaged colour value that is controlled by both X- and Y-axis motion. RGB in the original code by David, will look into converting it to HSV.

## (S) `bang`

```
/pod[ID]/xy bang
```

_Handled by main `loop()`._

**Sends** to notify that a bump is detected.

The average values of the X- and Y-axis motion is buffered. When the previous value differs significantly from the current, it is registered as a bump and a message of the following format is sent.

## (S) `acclx` or `accly` [Data]

```
/pod[ID]/acclx [Data]
/pod[ID]/accly [Data]
```

_Handled by `sendRawAcclOSC()`._

**Sends** raw accelerometer readouts.

[Data]: (float) the raw readout from the accelerometer.

## (R) `getAcclRange`

```
/pod[ID]/getAcclRange
```

_Handled by `parseOSCMessage()`._

**Receives** by Arduino so it will send the range (minimum and maximum values) of accelerometer setup on X- and Y-axis over OSC.

## (S) `minAcclx`, `maxAcclx`, `minAccly` and `maxAccly`

```
/pod[ID]/minAcclx [Data]
/pod[ID]/maxAcclx [Data]
/pod[ID]/minAccly [Data]
/pod[ID]/maxAccly [Data]
```

_Handled by `parseOSCMessage()`._

**Sends** range (minimum and maximum values) of accelerometer setup on X- and Y-axis.

[Data]: (float) the minimum/maximum range set for the accelerometer.

All four messages will be sent once a `/pod[ID]/getAcclRange` is received. It should be safe to assume that if one is received, the others will follow shortly (unless the packet is lost). Internally, all four messages should be in a single bundle.

## (R) `calibrate`

```
/pod[ID]/calibrate
```

_Handled by `parseOSCMessage()`._

**Receives** by Arduino so it will perform an accelerometer range calibration.

**WARNING**: `/pod[ID]/calibrate` is blocking. This means that the pod will enter calibration mode for the full 20 seconds.

This needs some explanation. When server (Max/MSP) sends out `/pod[ID]/calibrate`, the specific pod will enter calibration mode (static yellow light) for 20 seconds (`CALIBRATION_DURATION` macro).

To calibrate, locate the pod that's in solid yellow, pick up and hold the untethered end of the pod and move around the tie point in a circular motion. During this process, the angle of the pod should not exceed 2/3 of the angle of the most extreme swing. Gently return the pod to neutral position after the pod becomes unlit.

`/pod[ID]/resetCalibration` will reset the accelerometer to default value when it's not in calibration mode.

**Visual behaviour**: The pod will light up in yellow for 20 seconds and turn off for a second. Afterwards normal operation will resume.

## (R) `resetCalibration`

```
/pod[ID]/resetCalibration
```

_Handled by `parseOSCMessage()`._

**Receives** by Arduino so it will reset accelerometer range calibration to default values.

The default values of the accelerometer ranges are defined in [hwconf.h](main/hwconf.h) as `dMinAcclX`, `dMaxAcclX`, `dMinAcclY`, `dMaxAcclY`.

## (S) `resetComplete`

```
/pod[ID]/resetComplete
```

_Handled by `parseOSCMessage()`._

**Sends** after the calibration is reset to default values (`dMinAcclX`, `dMaxAcclX`, `dMinAcclY`, `dMaxAcclY` in [`hwconf.h`](main/hwconf.h)).

Once `/pod[ID]/resetCalibration` is called and accelerometer range has been reset to default values, this message will be sent. This is probably necessary as there is no visual indication on if the accelerometer range has been reset.

## (R) `reboot`

```
/pod[ID]/reboot
```

_Handled by `parseOSCMessage()`._

**Receives** by Arduino so it will soft reboot. All intermediate variables should be reset to default value (for example, accelerometer range).

**WARNING**: `/pod[ID]/reboot` is blocking. This means the pod will not function until the reboot is complete.

**Visual Behaviour**: Visually, the pod will blink on and off in green every 500 milliseconds for three times and the normal [bootup behaviour](README.md#bootup-sequence) applies.

## (R) `ident`

```
/pod[ID]/ident
```

_Handled by `parseOSCMessage()`._

**Receives** by Arduino so it will identify the pod that matches a particular ID.

**WARNING**: `/pod[ID]/ident` is blocking. This means the pod will not function for five seconds (until the identification process is complete).

**Intended Behaviour**: Visually, the corresponding pod will blink on and off in magenta every 500 milliseconds for five times so that it can be located.
