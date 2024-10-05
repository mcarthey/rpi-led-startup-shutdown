# Raspberry Pi LED Indicator Scripts

## Overview

This project provides Python scripts to control an LED connected to a Raspberry Pi's GPIO pin. The LED offers visual feedback during different operational states:

- **Startup**: The LED blinks rapidly to indicate that the Raspberry Pi is booting up.
- **Normal Operation**: The LED stays on steadily to show that the Raspberry Pi is running normally.
- **Shutdown**: The LED pulses slowly to indicate that the Raspberry Pi is shutting down.

## Hardware Requirements

- **Raspberry Pi** (any model with GPIO pins)
- **LED** (preferably with a built-in resistor)
- **Resistor** (220Ω to 330Ω) if the LED doesn't have a built-in resistor
- **Connecting Wires**
- **Breadboard** or soldering tools (optional)

## Wiring Instructions

1. **Connect the LED Anode (+)** (longer leg) to **GPIO18** (Physical Pin 12) through a current-limiting resistor.
2. **Connect the LED Cathode (-)** (shorter leg) to **Ground (GND)** on the Raspberry Pi (Physical Pin 6).

<pre><code>
Raspberry Pi GPIO Header (Top View)

 +--------------------------------------------------+
 |                   Raspberry Pi                   |
 |                GPIO Header Pins                  |
 +--------------------------------------------------+

  (Pin Numbers)        (BCM GPIO Numbers)

         3V3  (1) o o (2)  5V
    GPIO2  (3) o o (4)  5V
    GPIO3  (5) o o (6)  GND -----------------------------+
    GPIO4  (7) o o (8)  GPIO14                           |
       GND  (9) o o (10) GPIO15                          |
   GPIO17 (11) o o (12) GPIO18 -------------------+      |
   GPIO27 (13) o o (14) GND                       |      |
   GPIO22 (15) o o (16) GPIO23                    |      |
     3V3 (17) o o (18) GPIO24                     |      |
   GPIO10 (19) o o (20) GND                       |      |
    GPIO9 (21) o o (22) GPIO25                    |      |
   GPIO11 (23) o o (24) GPIO8                     |      |
       GND (25) o o (26) GPIO7                    |      |
                                                  |      |
                                                  |      |
                                                  |      |
                                                  |      |
                                                  |      |
                                                  |      |
 +------------------------------------------------+      |
 |                                                       |
 |                                                       |
 |                LED and Resistor                       |
 |                                                       |
 +-------------------------------------------------------+

Wiring Connections:

1. **Connect GPIO18 (Physical Pin 12)** to one end of a **220Ω to 330Ω resistor**.
2. **Connect the other end of the resistor** to the **Anode (+)** of the **LED**.
3. **Connect the Cathode (-) of the LED** to **Ground (GND, Physical Pin 6)**.

Simplified Diagram:

   GPIO18 (Pin 12) ----[Resistor]---->|---- GND (Pin 6)
                                     LED

Detailed Connection Diagram:

              +------------------------+
              |        Raspberry Pi    |
              |        (Top View)      |
              +------------------------+

                   GPIO18 (Pin 12)
                         |
                         |  (Connect to)
                         |  (Anode +)
                        [Resistor]
                         |
                         |
                        |>|   (LED)
                         |
                         |
                   GND (Pin 6)

Legend:

- `[Resistor]`: Current-limiting resistor (220Ω to 330Ω).
- `|>|`: LED symbol pointing from Anode (+) to Cathode (-).
- `GPIO18 (Pin 12)`: GPIO pin connected to the resistor and LED anode.
- `GND (Pin 6)`: Ground pin connected to the LED cathode.

---

## Explanation of Connections

- **GPIO18 (Physical Pin 12)**: This pin is configured in your scripts to control the LED. It's connected to the **Anode (+)** of the LED through a resistor.

- **Resistor**: The resistor limits the current flowing through the LED to prevent damage. A value between **220Ω and 330Ω** is recommended.

- **LED**:
  - **Anode (+)**: The longer leg of the LED, connected to the resistor.
  - **Cathode (-)**: The shorter leg of the LED, connected to **Ground (GND)**.

- **Ground (GND, Physical Pin 6)**: This pin is connected to the **Cathode (-)** of the LED, completing the circuit.

---

## Alternative Diagram with Pin Numbers

```plaintext
Raspberry Pi GPIO Header Pins (Top View)

 +--------------------------------------------------+
 | Pin | Name        | Description                  |
 +-----+-------------+------------------------------+
 |  1  | 3.3V        |                              |
 |  2  | 5V          |                              |
 |  3  | GPIO2       |                              |
 |  4  | 5V          |                              |
 |  5  | GPIO3       |                              |
 |  6  | GND -------+|------------------------+     |
 |  7  | GPIO4      |                         |     |
 |  8  | GPIO14     |                         |     |
 |  9  | GND        |                         |     |
 | 10  | GPIO15     |                         |     |
 | 11  | GPIO17     |                         |     |
 | 12  | GPIO18 ----+                         |     |
 | 13  | GPIO27     |                         |     |
 | 14  | GND        |                         |     |
 | 15  | GPIO22     |                         |     |
 | 16  | GPIO23     |                         |     |
 | 17  | 3.3V       |                         |     |
 | 18  | GPIO24     |                         |     |
 | 19  | GPIO10     |                         |     |
 | 20  | GND        |                         |     |
 | 21  | GPIO9      |                         |     |
 | 22  | GPIO25     |                         |     |
 | 23  | GPIO11     |                         |     |
 | 24  | GPIO8      |                         |     |
 | 25  | GND        |                         |     |
 | 26  | GPIO7      |                         |     |
 +-----+-------------+-------------------------+-----+

Wiring:

1. **GPIO18 (Pin 12)** connects to **Resistor**.
2. **Resistor** connects to **Anode (+)** of **LED**.
3. **Cathode (-)** of **LED** connects to **GND (Pin 6)**.

---

## Visual Representation

```plaintext
    +-------------------+        +---------+
    | Raspberry Pi GPIO |        |   LED   |
    |      Header       |        |         |
    +-------------------+        +----+----+
             |                      |
             |                      |
       GPIO18 (Pin 12)              |
             |                      |
          [Resistor]                |
             |                      |
             +----------------------+ (Anode +)
                                    |
                                   |>|   (LED Symbol)
                                    |
             +----------------------+ (Cathode -)
             |                      |
             |                      |
          GND (Pin 6)               |
             |                      |
             |                      |
    +-------------------+        +----+----+
    |                   |        |         |
    |                   |        |         |
    +-------------------+        +---------+
</pre></code>

**Note**: Always use a resistor in series with the LED to prevent excessive current, which can damage both the LED and the Raspberry Pi.

## Installation

1. **Clone the Repository**

   ```bash
   git clone https://github.com/yourusername/your-repo-name.git
   cd your-repo-name
   ```

2. **Run the Install Script**

   ```bash
   sudo ./install.sh
   ```

3. **Reboot the Raspberry Pi**

   ```bash
   sudo reboot
   ```

## Testing the Setup

After rebooting, observe the LED behavior:

- **Startup**: The LED should blink rapidly during boot.
- **Normal Operation**: The LED should stay on steadily.
- **Shutdown**: When you shut down the Raspberry Pi, the LED should pulse slowly until the system powers off.

## Uninstallation

If you wish to remove the scripts and services:

1. **Run the Uninstall Script**

   ```bash
   sudo ./uninstall.sh
   ```

2. **Reboot the Raspberry Pi**

   ```bash
   sudo reboot
   ```

## Customization

### Changing the GPIO Pin

If you want to use a different GPIO pin for the LED:

1. **Edit the Python Scripts**

   - Open each of the three scripts (`led_startup.py`, `led_on.py`, `led_shutdown.py`) and change the `LED_PIN` variable to your desired GPIO pin number.

2. **Update Wiring**

   - Adjust your wiring to connect the LED Anode (+) to the new GPIO pin.

### Adjusting Blink and Pulse Settings

- **led_startup.py**

  - `BLINK_DELAY`: Change the value to adjust the blink speed during startup.
  - Loop Range: Modify the `range(30)` in the `for` loop to change the duration.

- **led_shutdown.py**

  - `time.sleep(0.02)`: Adjust this value in the `for` loops to change the pulsing speed.
  - Duty Cycle Range: Modify the `range` values in the loops to change brightness levels.

## Files Included

- `install.sh`: Installation script to set up the scripts and services.
- `uninstall.sh`: Uninstallation script to remove the scripts and services.
- `led_startup.py`: Python script to blink the LED during startup.
- `led_on.py`: Python script to keep the LED on during normal operation.
- `led_shutdown.py`: Python script to pulse the LED during shutdown.

## Dependencies

Ensure you have the required Python libraries installed:

```bash
sudo apt-get install python3-rpi.gpio
```

## Safety Precautions

- **Power Off Before Wiring**: Always shut down and unplug your Raspberry Pi before modifying connections.
- **Use a Resistor**: Always include a current-limiting resistor with your LED to prevent damage.
- **Double-Check Connections**: Verify all wiring before powering on the Raspberry Pi to avoid short circuits.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please feel free to submit a pull request or open an issue for suggestions and improvements.

## Contact

For questions or support, please contact [your email address].

---

## Detailed Script Explanations

### `led_startup.py`

This script makes the LED blink rapidly during the startup process.

```python
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
```

### `led_on.py`

This script keeps the LED turned on steadily during normal operation.

```python
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
```

### `led_shutdown.py`

This script makes the LED pulse slowly during the shutdown process.

```python
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
```

---

## Installation Scripts

### `install.sh`

```bash
#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Variables
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
INSTALL_DIR="/usr/local/bin"
SERVICE_DIR="/etc/systemd/system"

# Script files
SCRIPTS=("led_startup.py" "led_shutdown.py" "led_on.py")

# Ensure the script is run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root. Please run 'sudo ./install.sh'"
   exit 1
fi

echo "Installing LED control scripts..."

# Copy scripts to /usr/local/bin and make them executable
for SCRIPT in "${SCRIPTS[@]}"; do
    echo "Copying $SCRIPT to $INSTALL_DIR..."
    cp "$SCRIPT_DIR/$SCRIPT" "$INSTALL_DIR/"
    chmod +x "$INSTALL_DIR/$SCRIPT"
done

echo "Creating systemd service files..."

# Create led-startup.service
cat << EOM > "$SERVICE_DIR/led-startup.service"
[Unit]
Description=LED Startup Blinking
DefaultDependencies=no
After=local-fs.target

[Service]
Type=oneshot
ExecStart=$INSTALL_DIR/led_startup.py
RemainAfterExit=no

[Install]
WantedBy=default.target
EOM

# Create led-shutdown.service
cat << EOM > "$SERVICE_DIR/led-shutdown.service"
[Unit]
Description=LED Shutdown Pulsing
DefaultDependencies=no
Before=shutdown.target

[Service]
Type=oneshot
ExecStart=$INSTALL_DIR/led_shutdown.py
TimeoutStopSec=0
RemainAfterExit=no

[Install]
WantedBy=shutdown.target
EOM

# Create led-on.service
cat << EOM > "$SERVICE_DIR/led-on.service"
[Unit]
Description=LED On During Normal Operation
After=multi-user.target

[Service]
Type=simple
ExecStart=$INSTALL_DIR/led_on.py
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOM

echo "Reloading systemd daemon..."
systemctl daemon-reload

echo "Enabling and starting services..."

# Enable and start led-startup.service
systemctl enable led-startup.service

# Enable led-shutdown.service
systemctl enable led-shutdown.service

# Enable and start led-on.service
systemctl enable led-on.service
systemctl start led-on.service

echo "Installation complete."
```

### `uninstall.sh`

```bash
#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Variables
INSTALL_DIR="/usr/local/bin"
SERVICE_DIR="/etc/systemd/system"

# Script files
SCRIPTS=("led_startup.py" "led_shutdown.py" "led_on.py")

# Ensure the script is run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root. Please run 'sudo ./uninstall.sh'"
   exit 1
fi

echo "Stopping and disabling services..."

# List of services
SERVICES=("led-on.service" "led-startup.service" "led-shutdown.service")

# Stop and disable the services if they exist
for SERVICE in "${SERVICES[@]}"; do
    SERVICE_FILE="$SERVICE_DIR/$SERVICE"
    if [ -f "$SERVICE_FILE" ]; then
        if systemctl is-active --quiet "$SERVICE"; then
            echo "Stopping $SERVICE..."
            systemctl stop "$SERVICE"
        else
            echo "$SERVICE is not running."
        fi
        if systemctl is-enabled --quiet "$SERVICE"; then
            echo "Disabling $SERVICE..."
            systemctl disable "$SERVICE"
        else
            echo "$SERVICE is not enabled."
        fi
    else
        echo "$SERVICE does not exist."
    fi
done

echo "Removing service files..."

# Remove the service files if they exist
for SERVICE in "${SERVICES[@]}"; do
    SERVICE_FILE="$SERVICE_DIR/$SERVICE"
    if [ -f "$SERVICE_FILE" ]; then
        echo "Removing $SERVICE_FILE..."
        rm "$SERVICE_FILE"
    else
        echo "$SERVICE_FILE does not exist."
    fi
done

echo "Reloading systemd daemon..."
systemctl daemon-reload

echo "Removing scripts..."

# Remove the scripts if they exist
for SCRIPT in "${SCRIPTS[@]}"; do
    SCRIPT_PATH="$INSTALL_DIR/$SCRIPT"
    if [ -f "$SCRIPT_PATH" ]; then
        echo "Removing $SCRIPT_PATH..."
        rm "$SCRIPT_PATH"
    else
        echo "$SCRIPT_PATH does not exist."
    fi
done

echo "Uninstallation complete."
```

---

## Additional Tips

- **Testing the Scripts Individually**

  - You can test each script manually by running:

    ```bash
    sudo python3 led_startup.py
    sudo python3 led_on.py
    sudo python3 led_shutdown.py
    ```

- **Python Version**

  - Ensure you're using Python 3, as the scripts are written for Python 3.

- **Permissions**

  - The scripts should have executable permissions. The `install.sh` script handles this, but if needed, you can set permissions manually:

    ```bash
    chmod +x led_startup.py led_on.py led_shutdown.py
    ```
---
