#!/bin/sh

# Use the user provided pulseaudio latency or 80ms if unprovided.
# This is to fix crackling audio issues when running inside of the container.
[ '$PULSE_LATENCY_MSEC' ] || export PULSE_LATENCY_MSEC='80'

exec /app/extra/runescape-launcher "$@"
