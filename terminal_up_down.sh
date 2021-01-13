#!/usr/bin/env sh

# APP is the binary name you see when you do ps
APP="tilix"

# Use the app from current workpace first, or any if not available
TPID=$(ps aux | pgrep $APP)

if [ "$TPID" ]
then
  ACTIVE_FOCUS_WINDOW_PID=$(xdotool getwindowfocus getwindowpid)

  if [ "$ACTIVE_FOCUS_WINDOW_PID" = "$TPID" ];
  then
    xdotool getactivewindow windowminimize
  else
    xdotool search --class --onlyvisible $APP windowactivate windowraise windowfocus
  fi
else
  $APP &
fi