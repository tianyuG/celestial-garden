# General format of OSC messages

## General rules
* Space between parts of the messages should be interpreted as two parts of the messages, as opposed to one single message. Form the first part of the message and use `add()` of the `OSCMessage` class to add the additioal parts of the message. This is needed for the Max patch to parse the message correctly.

    For example, `/bouy01/x 127` should be formed by creating the `OSCMessage` object that is initialised with `/bouy01/x`, and then use the `add(127)` function to add the second part of the message to the original object. 

* [ID]: (`char*` as part of the string) 2-character zero-padded identification number for the arduino board, as specified in `BOARD_IDENT.md`.

    Caviat: Use `boardIndex` (*zero-indexed*) global variable to determine the actual `[ID]` (*one-indexed*).

## Messages with X- or Y-axis accelerometer data
```
/bouy[ID]/x [Data]
/bouy[ID]/y [Data]
```
[Data]: (`uint8_t`) Raw accelerometer readout. 

## Messages with current average of the colour value controlled by the X- and Y-axis motion
```
/bouy[ID]/xy [Data]
```
[Data]: (`uint8_t`) Averaged colour value that is controlled by both X- and Y-axis motion. RGB in the original code by David, will look into converting it to HSV.

## Messages notifying that a bump is detected.
The average values of the X- and Y-axis motion is buffered. When the previous value differs significantly from the current, it is registered as a bump and a message of the following format is sent. 
```
/bouy[ID]/xy bang
```