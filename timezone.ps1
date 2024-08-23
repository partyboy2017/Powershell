net stop w32time
w32tm /config /manualpeerlist:"129.6.15.28, 132.163.97.1, 128.138.140.44" /syncfromflags:manual /update
set-timezone -ID "Eastern Standard Time"
net start w32time
w32tm /resync
