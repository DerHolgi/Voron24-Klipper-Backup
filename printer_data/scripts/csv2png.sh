#!/bin/bash 
echo  "************ Analyzing Inputshaper data for X axis ************"
~/klipper/scripts/calibrate_shaper.py /tmp/resonances_x_*.csv -o /tmp/shaper_calibrate_x.png
echo 
echo
echo  "************ Analyzing Inputshaper data for Y axis ************"
~/klipper/scripts/calibrate_shaper.py /tmp/resonances_y_*.csv -o /tmp/shaper_calibrate_y.png

