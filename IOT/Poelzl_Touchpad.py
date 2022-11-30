from machine import Pin, TouchPad
from time import sleep

touch=TouchPad(Pin(14))
led=Pin(2,Pin.OUT)

touch.config(300)

while True:
    if touch.read()<=300:
        led.value(not led.value())
    
