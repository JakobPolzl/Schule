from machine import Pin,
import time

yellow=Pin(26, Pin.OUT)
green=Pin(27, Pin.OUT)
red=Pin(25,Pin.OUT)
push_button = Pin(33, Pin.IN)

def knopf():
    redzugreen()
    time.sleep(1)
    greenzured()

def redzugreen():
    red.value(1)
    time.sleep(5)
    yellow.value(1)
    time.sleep(2)
    red.value(0)
    yellow.value(0)
    green.value(1)
    time.sleep(5)

def greenzured():
    i = 1
    while i < 8:
        green.value( not green.value())
        time.sleep(0.5)
        i += 1
    green.value(0)
    yellow.value(1)
    time.sleep(1)
    yellow.value(0)
    red.value(1)

while True:

  logic_state = push_button.value()
  if logic_state == True:     # if pressed the push_button
      knopf()             # led will turn ON



