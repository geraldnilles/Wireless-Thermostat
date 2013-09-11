
; Interrupt Prioerity
; 1. Pin Change (Volume Switch)
; 2. Timer (Periodic Status check)
; 3. UART  (Bluetooth Messages)
; 4. ADC   (Server when ADC is ready)
 

start:	
; Setup External Pin Interrupt
; Setup Timer to interrupt every 10 seconds
; Setup UART and its Interrupt
; Setup ADC Interrupt
goto loop



loop:
	; go to sleep and wait for interrupt

goto loop



adc_ready:	; This will be called whenever the ADC is ready
	; Read value from ADC register
	; Compare Set temperature to measured temp
	; Branch Turn off if lower

turn_on:
	; turn on the GPIO
	ret ; return to the loop

turn_off:
	; turn off the GPIO
	ret ; return to the loop


msg_recv: 	; This is called whenever a UART packet is recieved
	; if char == 0x00 ==> Turn off AC
	; if char == 0x01 ==> turn on AC
	; if char == 0x02 ==> Respond with current temperature
	; if char -- 0x03 ==> RESET
	; if char is somethine else, set the temprature to that 


timer_ready:
	; Arm the ADC for a read
	; set timeer to 10 seconds
	; enable switch interupt


switch_pressed:
	; set timer to 1 seconds
	; disable switch interrupt

