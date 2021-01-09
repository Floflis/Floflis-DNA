#!/bin/bash
if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
   echo "Power/energy:"
   echo "   shutdown, shu, off          Shutdown/power-off Floflis"
   echo "   restart, res, reboot        Restarts Floflis"
#   echo "   suspend, sus, standby       Suspends Floflis"
fi

if [ "$1" = "poweroff" ] || [ "$1" = "off" ] || [ "$1" = "shutdown" ] || [ "$1" = "shu" ]; then
   sudo poweroff
fi

if [ "$1" = "reboot" ] || [ "$1" = "restart" ] || [ "$1" = "res" ]; then
   sudo reboot
fi
# todo:if command is "reset" or "refresh", ask

if [ "$1" = "suspend" ] || [ "$1" = "sus" ] || [ "$1" = "standby" ]; then
    if [ -e /usr/local/bin/*antiX* ]; then
       echo "- This is a antiX-based OS. Suspending your system is not supported, sorry."
       else
          systemctl suspend
fi
fi

# ask if user really wants to shutdown/reboot/suspend
#todo: systemctl hibernate / systemctl hybrid-sleep
# alternative to systemctl suspend
