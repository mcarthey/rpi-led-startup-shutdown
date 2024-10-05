#!/usr/bin/env python3

import RPi.GPIO as GPIO
import time

# Configuration
LED_PIN = 18       # GPIO pin number where the LED is connected
BLINK_DELAY = 0.2  # Delay in seconds between blinks (adjust for speed)

# Setup GPIO using BCM numbering
GPIO.setmode(GPIO.BCM)
GPIO.setup(LED_PIN, GPIO.OUT)

try:
    # Blink the LED rapidly during startup
    for _ in range(30):  # Number of blinks (adjust for duration)
        GPIO.output(LED_PIN, GPIO.HIGH)  # Turn LED on
        time.sleep(BLINK_DELAY)          # Wait
        GPIO.output(LED_PIN, GPIO.LOW)   # Turn LED off
        time.sleep(BLINK_DELAY)          # Wait
finally:
    # Ensure the LED is turned off and clean up GPIO settings
    GPIO.output(LED_PIN, GPIO.LOW)
    GPIO.cleanup()

