#!/usr/bin/env python3

import RPi.GPIO as GPIO
import time

# Configuration
LED_PIN = 18  # GPIO pin connected to the LED

# Setup GPIO using BCM numbering
GPIO.setmode(GPIO.BCM)
GPIO.setup(LED_PIN, GPIO.OUT)

# Initialize PWM on the LED pin with a frequency of 1Hz
pwm = GPIO.PWM(LED_PIN, 100)  # 100Hz for slow pulsing
pwm.start(0)  # Start PWM with 0% duty cycle (LED off)

try:
    # Pulse the LED slowly during shutdown
    # Remove infinite loop and set a finite number of pulses
    for _ in range(5):  # Adjust the number of pulses as needed
        # Gradually increase brightness
        for duty_cycle in range(0, 101, 1):  # 0% to 100% in 1-step increments
            pwm.ChangeDutyCycle(duty_cycle)
            time.sleep(0.01)  # Adjust for smoothness
        # Gradually decrease brightness
        for duty_cycle in range(100, -1, -1):  # 100% to 0% in 1-step decrements
            pwm.ChangeDutyCycle(duty_cycle)
            time.sleep(0.02)
finally:
    # Stop PWM and clean up GPIO settings
    pwm.stop()
    GPIO.output(LED_PIN, GPIO.LOW)
    GPIO.cleanup()

