echo "running" >> /home/oyvind/test.log
setxkbmap -option caps:escape -rules evdev -model macbook78 &> ~/.xkb.log
/bin/xmodmap -e "keycode 49 = apostrophe" &>> ~/.xmodmap.log
