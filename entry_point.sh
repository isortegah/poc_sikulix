#!/bin/bash
source /opt/bin/functions.sh

export PERSIST="${PERSIST:=false}"
export OS="${OS:=linux}"
export BROWSER="${BROWSER:=chrome}"

echo $OS

function shutdown {
  kill -s SIGTERM $NODE_PID
  wait $NODE_PID
}

export GEOMETRY="$SCREEN_WIDTH""x""$SCREEN_HEIGHT""x""$SCREEN_DEPTH"

SERVERNUM=$(get_server_num)

Xvfb $DISPLAY -screen 0 $GEOMETRY &
NODE_PID=$!

trap shutdown SIGTERM SIGINT
for i in $(seq 1 10)
do
  xdpyinfo -display $DISPLAY >/dev/null 2>&1
  if [ $? -eq 0 ]; then
    break
  fi
  echo Waiting xvfb...
  sleep 0.5
done

fluxbox -display $DISPLAY &

x11vnc -forever -usepw -shared -ncache 10 -rfbport 5900 -display $DISPLAY &
# without password VNC
# x11vnc -forever -shared -rfbport 5900 -display $DISPLAY &
echo "VNC in port 5900"

cd /home/sikuser/poc
mvn test -Dos=$OS -DbrowserDefault=$BROWSER
if [ $PERSIST == "true" ]; then
    wait $NODE_PID
fi