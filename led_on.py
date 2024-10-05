#!/usr/bin/env python3

import RPi.GPIO as GPIO

# Configuration
LED_PIN = 18  # GPIO pin number where the LED is connected

# Setup GPIO using BCM numbering
GPIO.setmode(GPIO.BCM)
GPIO.setup(LED_PIN, GPIO.OUT)
GPIO.output(LED_PIN, GPIO.HIGH)  # Turn the LED on

try:
    # Keep the script running to maintain the LED state
    while True:
        pass  # Do nothing, just wait
except KeyboardInterrupt:
    pass  # Allow script to be interrupted cleanly
finally:
    # Ensure the LED is turned off and clean up GPIO settings
    GPIO.output(LED_PIN, GPIO.LOW)
    GPIO.cleanup()

