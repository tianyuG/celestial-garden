# Known Issues

## Board Misidentify Itself

`WONTFIX`/`INSUFFICIENTDATA`: Unable to replicate past initial occurrence.

**Description**: In rare circumstances, the Arduino board can misidentify its own serial number. This is unlikely going to happen as it has only has happened on serial interface once before.

**Interim fix**: Power cycle device (disconnect appropriate Ethernet cable, wait for a few seconds and then reconnect). If necessary, re-upload firmware.

## Board Refuse to Respond to OSC Messages

`INSUFFICIENTDATA`: Low priority due to complexity; also can be resolved with simple on-field solution.

**Description**: The Arduino board can refuse to respond to any OSC message even though it can still be sending the correct accelerometer data. The only time this has occurred was after booting back up [after a soft reboot request](OSC_MESSAGES.md#r-reboot).

Currently suspecting that the UDP module may not have fully initialised after a soft reboot.

**Interim fix**: Power cycle device (disconnect appropriate Ethernet cable, wait for a few seconds and then reconnect).
