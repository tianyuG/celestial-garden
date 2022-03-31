# Known Issues

- [Known Issues](#known-issues)
  - [Won't Fix/Can't Fix](#wont-fixcant-fix)
    - [Board Misidentifies Itself](#board-misidentifies-itself)
    - [Board Refuses to Respond to OSC Messages](#board-refuses-to-respond-to-osc-messages)
  - [Investigating](#investigating)
    - [Bump animation too short](#bump-animation-too-short)
    - [Pods are unresponsive or network data output is slow](#pods-are-unresponsive-or-network-data-output-is-slow)

## Won't Fix/Can't Fix

### Board Misidentifies Itself

`WONTFIX`/`INSUFFICIENTDATA`: Unable to replicate past initial occurrence.

**Description**: In rare circumstances, the Arduino board can misidentify its own serial number. This is unlikely going to happen as it has only has happened on serial interface once before.

**Interim fix**: Power cycle device (disconnect appropriate Ethernet cable, wait for a few seconds and then reconnect). If necessary, re-upload firmware.

### Board Refuses to Respond to OSC Messages

`INSUFFICIENTDATA`: Low priority due to complexity; also can be resolved with simple on-field solution.

**Description**: The Arduino board can refuse to respond to any OSC message even though it can still be sending the correct accelerometer data. The only time this has occurred was after booting back up [after a soft reboot request](OSC_MESSAGES.md#r-reboot).

Currently suspecting that the UDP module may not have fully initialised after a soft reboot.

**Interim fix**: Power cycle device (disconnect appropriate Ethernet cable, wait for a few seconds and then reconnect).

## Investigating

### Bump animation too short

Working on a buffer for HSV values to hopefully even out the result a bit.

### Pods are unresponsive or network data output is slow

Currently, both the audio computer and the diagnostics computer need to be connected to the network for the pods to be functioning properly. Ensure the connection to both computers are connected and stable.
