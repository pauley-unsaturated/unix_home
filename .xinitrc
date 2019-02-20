#!/bin/sh

# Mark's xinit

xkbset m
xkbset exp =m
xmodmap -e "keysym Print = Pointer_Button2"

eval "ssh-agent"
export SSH_AUTH_SOCK
export SSH_AGENT_PID

compton --backend=glx --vsync='drm' --no-dock-shadow --daemon

redshift -l geoclue2&

conky -p 5 -d&

. /usr/local/etc/xdg/xfce4/xinitrc


## Clean up ##

killall redshift
killall conky

if [ -n "$SSH_AGENT_PID" ] ; then
    kill -TERM $SSH_AGENT_PID > /dev/null 2>&1;
fi
