import machine
import math
import time

ledBlue = machine.Pin(2, machine.Pin.OUT)

MORSE_CODE_DICT = { 'A':'.-', 'B':'-...',
                    'C':'-.-.', 'D':'-..', 'E':'.',
                    'F':'..-.', 'G':'--.', 'H':'....',
                    'I':'..', 'J':'.---', 'K':'-.-',
                    'L':'.-..', 'M':'--', 'N':'-.',
                    'O':'---', 'P':'.--.', 'Q':'--.-',
                    'R':'.-.', 'S':'...', 'T':'-',
                    'U':'..-', 'V':'...-', 'W':'.--',
                    'X':'-..-', 'Y':'-.--', 'Z':'--..',
                    '1':'.----', '2':'..---', '3':'...--',
                    '4':'....-', '5':'.....', '6':'-....',
                    '7':'--...', '8':'---..', '9':'----.',
                    '0':'-----', ', ':'--..--', '.':'.-.-.-',
                    '?':'..--..', '/':'-..-.', '-':'-....-',
                    '(':'-.--.', ')':'-.--.-'}



def encrypt(name):
    cipher = ''
    for letter in name:
        if letter != ' ':
            cipher += MORSE_CODE_DICT[letter] + ' '
        else:
            cipher += ' '
 
    return cipher

def setSleep(name):
    code = encrypt(name.upper());
    for c in code:
        if c == '.':
            led.on()
            time.sleep(0.25)
            led.off()
            time.sleep(0.5)

        if c == '-':
            led.on()
            time.sleep(1)
            led.off()
            time.sleep(0.5)

        if c == ' ':
            time.sleep(1)
        

setSleep("Hallo")
