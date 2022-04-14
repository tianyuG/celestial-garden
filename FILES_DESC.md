# Files

- `main/main.ino`: Main Arduino file, firmware so to speak.
- `main/hwconf.h`: Header file for automatically configuring Arduino to set its MAC and IP address (as in hardware configuration) as well as server IP address and port. It also has some constants relating to accelerometer settings.
- `main/otacred.h`: Header file for storing the credential for over-the-air firmware updates (as in over-the-air credential). The effect of this file here is minimal: This is the credential to flash firmware over-the-air (or David put it better, over-the-copper), but anyone with a micro USB cable can flash without password, so it should be safe to leave the file here.
- `MaxMSP/diagnostics.maxpat`: Max patcher for diagnosing pods remotely.
- `MaxMSP/at_a_glance.maxpat`: Max patcher for demonstrating bumps and x- and y-accelerometer readouts.
