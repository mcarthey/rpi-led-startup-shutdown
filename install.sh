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
Conflicts=reboot.target
AllowIsolate=yes

[Service]
Type=oneshot
ExecStart=$INSTALL_DIR/led_shutdown.py
RemainAfterExit=no
TimeoutStartSec=15
KillMode=process

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
ExecStop=$INSTALL_DIR/led_shutdown.py
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

