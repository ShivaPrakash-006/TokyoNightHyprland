grim /tmp/shot.png
convert -scale 10% -blur 0x0.5 -resize 1000% /tmp/shot.png /tmp/blurred_shot.png
wlogout --protocol layer-shell -b 5 -T 300 -B 300
