# Files

- `main/main.ino`: Main Arduino file, firmware so to speak.
- `main/hwconf.h`: Header file for automatically configuring Arduino to set its MAC and IP address (as in hardware configuration) as well as server IP address and port. It also has some constants relating to accelerometer settings.
- `main/otacred.h`: Header file for storing the credential for over-the-air firmware updates (as in over-the-air credential). **This file is currently in the repo as the repository is private. It will be removed if the repository goes public.**
- `diagnostics/diagnostics.maxpat`: Max patcher for diagnosing pods remotely.
