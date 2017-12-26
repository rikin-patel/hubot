# Description:
#   Uses bot commands to switch on/off the LED lights. Circuit Desc as below:
#   GPIO-4(Pin-7) -> Breadboard-A -> BB-E LED(Big Leg) -> BB-F LED(Small Leg) -> BB-GND -> GPIO-GND(Pin-9)
#
# Dependencies:
#   "onoff": "1.1.9"
#
# Configuration:
#   N/A
#
# Commands:
#   tubelight on - Switches On the LED
#   tubelight off - Switches Off the LED
#
# Notes:
#   <optional notes required for the script>
#
# Author:
#   Rikin Patel - rikin-patel@live.in

gpio = require('onoff').Gpio
LED = new gpio 4,'out'
module.exports = (robot) ->
	robot.hear /tubelight on/i, (res) ->
		res.reply "Working On It - Setting oN"
		blinkLED()
		
	robot.hear /tubelight off/i, (res) ->
		res.reply "Working On It - Setting Off"
		endBlink()

blinkLED = ->
	console.log "readSync is #{LED.readSync()}"
	if LED.readSync() is 0
		console.log "readSync is 0"
		LED.writeSync 1
endBlink = ->
	console.log "readSync is #{LED.readSync()}"
	if LED.readSync() is 1
		LED.writeSync 0
		LED.unexport