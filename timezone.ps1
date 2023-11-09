w32tm /config /manualpeerlist:"129.6.15.28  132.163.97.1" /syncfromflags:manual /update
set-timezone -ID "Eastern Standard Time"
w32tm /resync
