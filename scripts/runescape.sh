#!/bin/sh

# Use the user provided pulseaudio latency or 80ms if unprovided.
# This is to fix crackling audio issues when running inside of the container.
[ '$PULSE_LATENCY_MSEC' ] || export PULSE_LATENCY_MSEC='80'

exec /app/extra/runescape-launcher "$@" &

if [ -z "${SHOW_LAUNCHER}" ]; then
    # The game won't be up instantly. So wait until we see 2 visible RuneScape windows.
    # While we're waiting, grab the first window ID. This will be the launcher window.
    until [ $(xdotool search --all --onlyvisible --classname "RuneScape" | wc -l) -eq 2 ]; do
        [ "$launcherId" ] || launcherId=$(xdotool search --all --onlyvisible --classname "RuneScape")
        sleep 2
    done

    # Unmap the launcher window from X. This keeps it running, but hides it from view.
    # It will close automatically when the game is closed by the user.
    xdotool windowunmap "$launcherId"
fi

exit 0
