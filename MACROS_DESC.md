# Macros

Changing these macros will not affect the visual behaviour.

- `DISPLAY_DIAG`: (Set by default) Unset this macro to disable diagnostic information over serial connection.
  - `DIAG_PRINT`, `DIAG_PRINTLN` and `DIAG_PRINTHEX` outputs diagnostic information in Serial Monitor if `DISPLAY_DIAG` is set. Otherwise those diagnostic information will be ignored.
- `ENABLE_OTA`: (Set by default) Unset this macro to disable over-the-air firmware updates.
- `SERIAL_INIT_DELAY`: How long will Arduino wait before assuming that Serial connection is established. The code will halt if blocking logic (such as `while (!Serial) delay(10);`) is used. (in milliseconds)
- `CALIBRATION_DURATION`: How long should a [calibration cycle](OSC_MESSAGES.md#r-calibrate) be. (in milliseconds)

Changing these macros will affect the visual behaviour in one way or another.

- `LED_0_DATA`, `LED_0_CLK`, `LED_1_DATA`, `LED_1_CLK`, `LED_2_DATA`, `LED_2_CLK`, `LED_3_DATA`, `LED_3_CLK`: Denotes the pin that controls the lightstrips.
- `LED_TYPE`: Sets the microcontroller of the lightstrips.
- `COLOR_ORDER`: Sets the LED sequence for the lightstrips.
- `INIT_BRIGHTNESS`: Denotes the initial brightness of the lightstrip after bootup is complete. (0-255)
- `LIGHTS_PER_CYCLE`: How many LEDs will be turned on per `loop()` when bumped.
- `BUMP_THRESHOLD`: The value differential between average accelerometer readings to be registered as a bump. (less sensitive when increased)