## (Linux) Arduino IDE reports 'Permission denied'
This is usually caused by not having sufficient privilege to access the serial device.

In Arduino IDE, find out the name of your device by Selecting ***Tools -> Port***. In my case, the active serial port is ``/dev/ttyACM0``.

In terminal, check
```
ls -l /dev/ttyACM0
```

The readout should be like
```
crw-rw---- 1 root uucp 166, 0 Mar 10 09:38 /dev/ttyACM0
```

Take note of the fourth part (``uucp``). Then, use the command
```
sudo useradd -a -G uucp $(whoami)
```
to add yourself to the group. You should have access to the serial device after logging out or rebooting.

