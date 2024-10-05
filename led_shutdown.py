#!/usr/bin/env python3

import RPi.GPIO as GPIO
import time

# Configuration
LED_PIN = 18  # GPIO pin number where the LED is connected

# Setup GPIO using BCM numbering
GPIO.setmode(GPIO.BCM)
GPIO.setup(LED_PIN, GPIO.OUT)

# Initialize PWM on the LED pin with a frequency of 1Hz
pwm = GPIO.PWM(LED_PIN, 1)  # 1Hz for slow pulsing
pwm.start(0)  # Start PWM with 0% duty cycle (LED off)

try:
    # Pulse the LED slowly during shutdown
    while True:
        # Gradually increase brightness
        for duty_cycle in range(0, 101, 1):  # 0% to 100%
            pwm.ChangeDutyCycle(duty_cycle)
            time.sleep(0.02)  # Adjust for smoothness
        # Gradually decrease brightness
        for duty_cycle in range(100, -1, -1):  # 100% to 0%
            pwm.ChangeDutyCycle(duty_cycle)
            time.sleep(0.02)
except KeyboardInterrupt:
    pass  # Allow script to be interrupted cleanly
finally:
    # Stop PWM and clean up GPIO settings
    pwm.stop()
    GPIO.output(LED_PIN, GPIO.LOW)
    GPIO.cleanup()

