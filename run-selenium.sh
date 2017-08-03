#!/bin/bash

GEOMETRY="$SCREEN_WIDTH""x""$SCREEN_HEIGHT""x""$SCREEN_DEPTH"
Xvfb :99 -screen 0, $GEOMETRY &

XVFV_PID=$!

DISPLAY=:99

java -jar /opt/selenium/selenium-server-standalone.jar &

SELEN_PID=$!

rm -f /tmp/.X*lock

function shutdown {
  kill -s SIGTERM $SELEN_PID
  kill -s SIGTERM $XVFV_PID
  wait $XVFV_PID
}

trap shutdown SIGTERM SIGINT
wait $XVFV_PID
