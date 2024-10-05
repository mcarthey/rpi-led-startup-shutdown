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

