# Known Issues

- [Known Issues](#known-issues)
  - [Won't Fix/Can't Fix](#wont-fixcant-fix)
  - [Investigating](#investigating)
    - [Bump animation uses static colour](#bump-animation-uses-static-colour)
    - [Bump animation and idle animation does not transition well](#bump-animation-and-idle-animation-does-not-transition-well)
  - [Fixed](#fixed)
    - [Board Misidentifies Itself](#board-misidentifies-itself)
    - [Board Refuses to Respond to OSC Messages](#board-refuses-to-respond-to-osc-messages)
    - [Bump animation too short](#bump-animation-too-short)
    - [Pods are unresponsive or network data output is slow](#pods-are-unresponsive-or-network-data-output-is-slow)

## Won't Fix/Can't Fix

None currently.

## Investigating

### Bump animation uses static colour

Working on a function to change bump animation colour

### Bump animation and idle animation does not transition well

Currently idle animation uses `fill_gradient()` which makes it near impossible to transition from bump animation (`fill_gradient()` changes the lightstrip instantly, which is difficult to blend as it needs to be able to know the colour it is transition to -- trust me I tried). Planning to change `fill_gradient()` to `fill_solid()`.

## Fixed

### Board Misidentifies Itself

`RESOLVED` ~~`WONTFIX`/`INSUFFICIENTDATA`: Unable to replicate past initial occurrence~~

**Description**: In rare circumstances, the Arduino board can misidentify its own serial number. This is unlikely going to happen as it has only has happened on serial interface once before.

~~**Interim fix**: Power cycle device (disconnect appropriate Ethernet cable, wait for a few seconds and then reconnect). If necessary, re-upload firmware.~~

**Solution**: None needed. Appeared to be related to board 14 which was determined to be malfunctioning.

### Board Refuses to Respond to OSC Messages

`RESOLVED` ~~`INSUFFICIENTDATA`: Low priority due to complexity; also can be resolved with simple on-field solution.~~

**Description**: The Arduino board can refuse to respond to any OSC message even though it can still be sending the correct accelerometer data. The only time this has occurred was after booting back up [after a soft reboot request](OSC_MESSAGES.md#r-reboot).

Currently suspecting that the UDP module may not have fully initialised after a soft reboot.

~~**Interim fix**: Power cycle device (disconnect appropriate Ethernet cable, wait for a few seconds and then reconnect).~~

**Solution**: None needed. Appeared to be related to board 14 which was determined to be malfunctioning.

### Bump animation too short

`RESOLVED`

Working on a buffer for HSV values to hopefully even out the result a bit.

**Solution**: Changed how bump animation was handled and the problem has been resolved.

### Pods are unresponsive or network data output is slow

`RESOLVED`

Currently, both the audio computer and the diagnostics computer need to be connected to the network for the pods to be functioning properly. Ensure the connection to both computers are connected and stable.

**Solution**: Changed UDP from anycast to broadcast address and the problem has been resolved.
