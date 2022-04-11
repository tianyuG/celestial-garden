# General format of OSC messages

- [General format of OSC messages](#general-format-of-osc-messages)
  - [General rules](#general-rules)
  - [Update notes](#update-notes)
  - [(S) `x` or `y` [Data]](#s-x-or-y-data)
  - [(S) `xy` [Data]](#s-xy-data)
  - [(S) `bang`](#s-bang)
  - [(S) `accl_x` or `accl_y` [Data]](#s-accl_x-or-accl_y-data)
  - [(R) `get_accl_range`](#r-get_accl_range)
  - [(S) `min_accl_x`, `max_accl_x`, `min_accl_y` and `max_accl_y`](#s-min_accl_x-max_accl_x-min_accl_y-and-max_accl_y)
  - [(R) `calibrate`](#r-calibrate)
  - [(R) `reset_calibration`](#r-reset_calibration)
  - [(S) `reset_complete`](#s-reset_complete)
  - [(R) `reboot`](#r-reboot)
  - [(R) `ident`](#r-ident)
  - [(S, R) `ping`](#s-r-ping)
  - [(S, R) `version`](#s-r-version)
  - [(R) `get_hue_0`, `get_hue_1`, `get_sat_0`, `get_sat_1`, `get_val_0`, `get_val_1`](#r-get_hue_0-get_hue_1-get_sat_0-get_sat_1-get_val_0-get_val_1)
  - [(S) `hue_0`, `hue_1`, `sat_0`, `sat_1`, `val_0`, `val_1` [Data]](#s-hue_0-hue_1-sat_0-sat_1-val_0-val_1-data)
  - [(R) `set_hue_0`, `set_hue_1`, `set_sat_0`, `set_sat_1`, `set_val_0`, `set_val_1` [Data]](#r-set_hue_0-set_hue_1-set_sat_0-set_sat_1-set_val_0-set_val_1-data)

## General rules

- Space between parts of the messages should be interpreted as two parts of the messages, as opposed to one single message. Form the first part of the message and use `add()` of the `OSCMessage` class to add the additional parts of the message. This is needed for the Max patch to parse the message correctly.

  For example, `/pod01/x 127` should be formed by creating the `OSCMessage` object that is initialised with `/pod01/x`, and then use the `add(127)` function to add the second part of the message to the original object.

- [ID]: (`char*` as part of the string) 2-character zero-padded identification number for the Arduino board, as specified in `BOARD_IDENT.md`.

  Caveat: Use `boardIndex` (_zero-indexed_) global variable to determine the actual `[ID]` (_one-indexed_).

- The messages are directional. '(S)' prefix denotes the message will be sent from Arduino. '(R)' prefix denotes the message received by Arduino needs to conform to this format in order to be recognised.

- All OSC address (e.g., the `pod[ID]` part of `/pod[ID]/x`) and methods (e.g., the `x` part of `/pod[ID]/x`) will be in snake_case. This does not affect other parts of data (should not matter for now, but just in case).

## Update notes

- 28 May 2022: Added new message `my_ip` and changed messaged from camelCase to snake_case. This can be breaking for some previous messages such as `acclx` (changed to `accl_x`) and `accly` (changed to `accl_y`), but the rationale behind this change was to improve readability. In addition, none of the messages were previously used in the Max/MSP patch, so these changes should not affect anything that's working currently.

- 1 April 2022: The OSC messaging can be completely turned off by unsetting the `ENABLE_OSC` macro. This can be useful during testing.

- 8 April 2022: Acknowledging that many messages that are handled by the `parseOSCMessage()` callback function do not currently work. It is not going to be fixed at this time as it is low in priority.

## (S) `x` or `y` [Data]

```
/pod[ID]/x [Data]
/pod[ID]/y [Data]
```

_Handled by `sendOSCStream()`._

**Sends** X- or Y-axis accelerometer data.

[Data]: (`uint8_t`) Raw accelerometer readout.

## (S) `xy` [Data]

```
/pod[ID]/xy [Data]
```

_Handled by `sendOSCStream()`._

**Sends** current average of the colour value controlled by the X- and Y-axis motion.

[Data]: (`uint8_t`) Averaged colour value that is controlled by both X- and Y-axis motion. RGB in the original code by David, will look into converting it to HSV.

## (S) `bang`

```
/pod[ID]/xy bang
```

_Handled by `sendOSCStream()`._

**Sends** to notify that a bump is detected.

The average values of the X- and Y-axis motion is buffered. When the previous value differs significantly from the current, it is registered as a bump and a message of the following format is sent.

## (S) `accl_x` or `accl_y` [Data]

```
/pod[ID]/accl_x [Data]
/pod[ID]/accl_y [Data]
```

_Handled by `sendRawAcclOSC()`._

**Sends** raw accelerometer readouts.

[Data]: (float) the raw readout from the accelerometer.

## (R) `get_accl_range`

```
/pod[ID]/get_accl_range
```

_Handled by `parseOSCMessage()`._

**Receives** by Arduino so it will send the range (minimum and maximum values) of accelerometer setup on X- and Y-axis over OSC.

## (S) `min_accl_x`, `max_accl_x`, `min_accl_y` and `max_accl_y`

```
/pod[ID]/min_accl_x [Data]
/pod[ID]/max_accl_x [Data]
/pod[ID]/min_accl_y [Data]
/pod[ID]/max_accl_y [Data]
```

_Handled by `parseOSCMessage()`._

**Sends** range (minimum and maximum values) of accelerometer setup on X- and Y-axis.

[Data]: (float) the minimum/maximum range set for the accelerometer.

All four messages will be sent once a `/pod[ID]/get_accl_range` is received. It should be safe to assume that if one is received, the others will follow shortly (unless the packet is lost). Internally, all four messages should be in a single bundle.

## (R) `calibrate`

```
/pod[ID]/calibrate
```

_Handled by `parseOSCMessage()`._

**Receives** by Arduino so it will perform an accelerometer range calibration.

**WARNING**: `/pod[ID]/calibrate` is blocking. This means that the pod will enter calibration mode for the full 20 seconds.

This needs some explanation. When server (Max/MSP) sends out `/pod[ID]/calibrate`, the specific pod will enter calibration mode (static yellow light) for 20 seconds (`CALIBRATION_DURATION` macro).

To calibrate, locate the pod that's in solid yellow, pick up and hold the untethered end of the pod and move around the tie point in a circular motion. During this process, the angle of the pod should not exceed 2/3 of the angle of the most extreme swing. Gently return the pod to neutral position after the pod becomes unlit.

`/pod[ID]/reset_calibration` will reset the accelerometer to default value when it's not in calibration mode.

**Visual behaviour**: The pod will light up in yellow for 20 seconds and turn off for a second. Afterwards normal operation will resume.

## (R) `reset_calibration`

```
/pod[ID]/reset_calibration
```

_Handled by `parseOSCMessage()`._

**Receives** by Arduino so it will reset accelerometer range calibration to default values.

The default values of the accelerometer ranges are defined in [`hwconf.h`](main/hwconf.h) as `dMinAcclX`, `dMaxAcclX`, `dMinAcclY`, `dMaxAcclY`.

## (S) `reset_complete`

```
/pod[ID]/reset_complete
```

_Handled by `parseOSCMessage()`._

**Sends** after the calibration is reset to default values (`dMinAcclX`, `dMaxAcclX`, `dMinAcclY`, `dMaxAcclY` in [`hwconf.h`](main/hwconf.h)).

Once `/pod[ID]/reset_calibration` is called and accelerometer range has been reset to default values, this message will be sent. This is probably necessary as there is no visual indication on if the accelerometer range has been reset.

## (R) `reboot`

```
/pod[ID]/reboot
```

_Handled by `parseOSCMessage()`._

**Receives** by Arduino so it will soft reboot. All intermediate variables should be reset to default value (for example, accelerometer range).

**WARNING**: `/pod[ID]/reboot` is blocking. This means the pod will not function until the reboot is complete.

**Visual Behaviour**: The pod will blink on and off in green every 500 milliseconds for three times and the normal [bootup behaviour](README.md#bootup-sequence) applies.

## (R) `ident`

```
/pod[ID]/ident
```

_Handled by `parseOSCMessage()`. Currently one `ident` message would result in what appears to be multiple responses of `ident`s._

**Receives** by Arduino so it will identify the pod that matches a particular ID.

**WARNING**: `/pod[ID]/ident` is blocking. This means the pod will not function for five seconds (until the identification process is complete).

**Visual Behaviour**: The corresponding pod will blink on and off in magenta every 500 milliseconds for five times so that it can be located.

## (S, R) `ping`

```
/pod[ID]/ping
/pod[ID]/ping 1
```

_Handled by `parseOSCMessage()`. Currently not working._

**Receives** ping from server and **sends** a response (`ping 1`) to ensure the program had not halted. Used for testing purposes.

## (S, R) `version`

```
/pod[ID]/version
/pod[ID]/version [Data]
```

_Handled by `parseOSCMessage()`. Currently not working._

**Receives** request from server and **sends** the internal version of the firmware. This functionality was not implemented prior to 1 April. Used to confirm that the Arduino board is running a particular version of the firmware.

[Data] (char\*) the internal versioning of the firmware.

## (R) `get_hue_0`, `get_hue_1`, `get_sat_0`, `get_sat_1`, `get_val_0`, `get_val_1`

```
/pod[ID]/get_hue_0
/pod[ID]/get_hue_1
/pod[ID]/get_sat_0
/pod[ID]/get_sat_1
/pod[ID]/get_val_0
/pod[ID]/get_val_1
```

_Handled by `parseOSCMessage()`. Currently not working._

**Receives** request to return the start (0) and end (1) HSV values.

## (S) `hue_0`, `hue_1`, `sat_0`, `sat_1`, `val_0`, `val_1` [Data]

```
/pod[ID]/hue_0 [Data]
/pod[ID]/hue_1 [Data]
/pod[ID]/sat_0 [Data]
/pod[ID]/sat_1 [Data]
/pod[ID]/val_0 [Data]
/pod[ID]/val_1 [Data]
```

_Handled by `parseOSCMessage()`. Currently not working._

**Sends** the current value for the start (0) and end (1) HSV values.

[Data]: (uint8_t for hue/sat, float for val)

## (R) `set_hue_0`, `set_hue_1`, `set_sat_0`, `set_sat_1`, `set_val_0`, `set_val_1` [Data]

```
/pod[ID]/set_hue_0 [Data]
/pod[ID]/set_hue_1 [Data]
/pod[ID]/set_sat_0 [Data]
/pod[ID]/set_sat_1 [Data]
/pod[ID]/set_val_0 [Data]
/pod[ID]/set_val_1 [Data]
```

_Handled by `parseOSCMessage()`. Currently not working._

**Receives** request to overwrite the start (0) and end (1) HSV values.

[Data]: (uint8_t for hue/sat, float for val)
