# Known Issues

- [Known Issues](#known-issues)
  - [Won't Fix/Can't Fix](#wont-fixcant-fix)
    - [Lightstrip flickers](#lightstrip-flickers)
  - [Investigating](#investigating)
    - [Bump animation uses static colour](#bump-animation-uses-static-colour)
    - [Bump animation and idle animation does not transition well](#bump-animation-and-idle-animation-does-not-transition-well)
  - [Fixed](#fixed)
    - [Board Misidentifies Itself](#board-misidentifies-itself)
    - [Board Refuses to Respond to OSC Messages](#board-refuses-to-respond-to-osc-messages)
    - [Bump animation too short](#bump-animation-too-short)
    - [Pods are unresponsive or network data output is slow](#pods-are-unresponsive-or-network-data-output-is-slow)

## Won't Fix/Can't Fix

### Lightstrip flickers

This is a known issue with this (APA102) particular LED when changing brightness. Can't get it fixed.

**Interim solution**: Make the brightness change really slow (twice a minute, as opposed to 7 to simulate meditation breathing).

See:

- [Functional Uncontrollable RGB LED Strip](https://forums.adafruit.com/viewtopic.php?f=8&t=133962)

- [Why APA102 LEDs Have Trouble At 24 MHz](https://www.pjrc.com/why-apa102-leds-have-trouble-at-24-mhz/)

- [APA102 LED panels have flicker problem](https://forums.adafruit.com/viewtopic.php?f=47&p=874973)

- [Flicker](https://github.com/jasoncoon/esp32-fastled-webserver/issues/8)
  > Soooooo all that I needed to do was change the FASTLED_SHOW_CORE to 1 instead of 0 and there is no longer any flicker at all. I have no idea why this would be the case but props to u/Jem_Spencer for the fix! Maybe change this in your code?
  
  Tried and that didn't help.

- [APA102 aka “Superled”](https://cpldcpu.wordpress.com/2014/08/27/apa102/)

  > One interesting addition is the “global” field for each LED, which allows to control the brightness of the LED in 32 steps from 0 to 31. [...] Interestingly, the APA102 started to flicker once I set the global brightness to 30 or below.

- [Frequently Asked Questions](https://github.com/FastLED/FastLED/wiki/Frequently-Asked-Questions)

  > APA102 leds allow for high data rates. I've driven them at 24Mhz+ for nearly 1000 leds. However, for some reason, some ways of manufacturing APA102 strips have problems with high data rates when the strip is long. If this happens, you can try slowing down the data rate that FastLED uses to write out APA102 data. Often, setting it to 12Mhz or 10Mhz works[...]

  Tried both 12Mhz and 10 Mhz and that didn't help.

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
