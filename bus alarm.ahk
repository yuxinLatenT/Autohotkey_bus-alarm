﻿::bus_alarm::
send, ^n
sleep, 1000
run, https://ebus.gov.taipei/EBus/VsSimpleMap?routeid=0100030700&gb=0
sleep, 3000
send, {down 11}
sleep, 1000
run, https://ebus.gov.taipei/EBus/VsSimpleMap?routeid=0100030700&gb=1
sleep, 3000
send, {down 11}
sleep, 1500
loaded := false
alarm()
{
	ErrorLevel = 0
	run, C:\Users\ASUS\Desktop\Autohotkey_bus-alarm\button03b.mp3
	Inputbox, time_pre, timekeeper(minute), set the alarm if you need, , 200, 150, , 700, , 60 
	if ErrorLevel = 1
	{
		return
	}
	time := time_pre * 60000
	sleep, %time%
	run, C:\Users\ASUS\Desktop\Autohotkey_bus-alarm\button03b.mp3
	return
}
while(loaded = false)
{
	loop 3{
		ImageSearch, x, y, 0, 0, A_ScreenWidth, A_ScreenHeight, 861-FR.png
  		if ErrorLevel = 0
  		{
			alarm()
			return
  		}
		send, {down 11}
		sleep, 1500
	}
	send, {up 26}
	sleep, 1000
	send, ^+{tab}
	sleep, 3000
	loop 3{
		ImageSearch, x, y, 0, 0, A_ScreenWidth, A_ScreenHeight, 861-FR.png
  		if ErrorLevel = 0
  		{
			alarm()
			return
  		}
		send, {down 11}
		sleep, 1500
	}
	send, {up 26}
	sleep, 1000
	send, ^{tab}
	sleep, 60000
}