Wireless Thermostat
===================

# Introduction
Once again, the apartment i live in has a POS thermostat.  It is clear that the temperature reading mechanism is not working at all.  The AC stays on 24/7 and is destroying our power bill.

## Goal
Create my own thermostat that works with my apartment's heating and cooling.  The temperature reading and relay control will happen on the lightswitch.  To set/read the temperature, i will use Bluetooth.  That will eliminate the need for making something pretty looking.

# Status

## Done

## TODO
* Buy parts
* Power BT Transicer and connect via PC (create UART part)
* Flash Hello-World program on ATTiny (Flash an LED)
* Send message to ATTiny over Bluetooth (Flash an LED)
* Fetch ADC reading with BT


# Feasability
Luckly, theh entire Heating and AC unit is controlled by a light switch.  I can just replace the current mechanical light switch with my own contraption.  This will let me experiment without permanently defacing my apartment (since i can easily replace the recepticle).

http://blog.theultimatelabs.com/2012/07/bluetooth-capacitive-touch-light-switch.html
 

# HW

## Controller
ATTiny87

Has UART and plenty of ADCs/GPIOs  

This will cost around $1.72

http://www.mouser.com/ProductDetail/Atmel/ATTINY87-XU/?qs=sGAEpiMZZMvqv2n3s2xjsWfDNH99npBWdw0d9K9dp2A%3d


## Bluetooth
I will use a Bluetooth to UART device. Amazon sells one called HC-05 which looks promising.  

I estimate this will cost $10

BY default, it looks like this device is discoverable.  As soon as it pairs, it just acts as a UART port.  This will be good to start.

In the future, it will probably be best if we keep it hidden once the pairing happens.  Using the reset button can clear the paring.  

## Temperature Sensing
The temperature will be sensed using a Thermistor.  There will be a voltage 

I estimate this will cost $0.25

## Power
I will use an off-the-shelf AC to 5V converter.  Same one that comes with a smartphone.

I estimate this will cost $5 (or free if i can salvage one from work)

## Circuit Switch
For simplicity and saftely, i will use a  5V relay.  That will ensure that the High oltage lines are isolated.

I Estimate this will cost $5

## Override Switch
Just in case something goes wrong, i will also setup an over-ride switch that holds the relay on.  This will let my wife manually turn it on.

I estimate this will cost $0.25

## Reset
I will also include a reset button just in case the SW runs into a ditch.

I estimate this will cost $0.10

## Board
I will need some sort of board to solder all of these components

# SW

## MCU SW
The MCU code will need to do the following
1. Read Temperature via ADC
2. Turn On/Off Replay via GPIO
3. Send UART/SPI commands to the Bluetooth module

### Bluetooth Protocol
We will need a special protocol for communicating over Bluetooth.  All communication will be initialized by the Server and the MCU will respond.  All requests will be exactly 6 characters long.  All responses will be exaclty 2 characters long

Here is a list of Server commands
* TEMP??
    * Ask for the temperature
    * Responds with 75
* TEMP75
    * Set the temperature.  This example shows 75
    * Responds with OK
* STATE?
    * Ask for the current State
    * Responds with ON or OF
* STATE0
    * Set the current state to 0 (off) or 1 (on)
    * responds with OK
* RESETS
    * Triggers a MCU reset
    * Deos not respond

## Server SW
I will use my server to send Bluetooth signals to the device.  This will allow a lot of cool functionality.  For example. i could automatically turn off the AC based when our Phone's leave the WiFi network.

The server will also log data on temperature, on on %.  

The server will be controlled using a WebUI.  The WebUI will also show usage data.

I could also link it to a Public Google Calendar.  That would let us control everything using our phones/computers.  You could jsut make an event where the title is the temperature.  When inside that event window, the server will set the tempture via Bluetooth.

The Bluetooth interface will just be a Unix-style UART interface.  There will be a COMM port that you write and read to.


# Installation
In side the switch receptical will be the following wires:

* From the breaker
    * Line
    * Nuetral
    * GND
* To the AC
    * Line
    * Nuetral

The 5V circuitry and coil of the raily will all be connected to GND.

	
	                                           ________
	--L------*---------------------------------|       |
	         |                  _________      | AC Fan|
	--N---*--+------------------|        |-----|_______|
	      |__|                  |  Relay |
	     | 5V|                  |________|
	--G--|___|
	
# Programming
I will likely need to use my Arduino in order to program the ATTiny chip.  I've done it before so it should be too bad.



* 
* 
