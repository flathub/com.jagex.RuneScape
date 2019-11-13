#!/bin/sh

# Use the user provided pulseaudio latency or 80ms if unprovided.
# This is to fix crackling audio issues when running inside of the container.
PULSE_LATENCY_MSEC=${PULSE_LATENCY_MSEC:-80}
export PULSE_LATENCY_MSEC

exec /app/extra/runescape-launcher "$@"

