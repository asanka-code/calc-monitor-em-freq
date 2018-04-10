#!/bin/bash

# Take the true width and height of the display
WIDTH=$( xrandr | grep "*" | awk '{print $1}' | cut -d'x' -f1 )
HEIGHT=$( xrandr | grep "*" | awk '{print $1}' | cut -d'x' -f2 )

# Take the frame rate of the display
FPS=$( xrandr | grep "*" | awk '{print $2}' | cut -d'*' -f1 )

# echo ${WIDTH}
# echo ${HEIGHT}
# echo ${FPS}

# Get the virtual width and height of the display
MODELINE=$(cvt ${WIDTH} ${HEIGHT} ${FPS} )

PIXEL_CLOCK=$(echo ${MODELINE} | awk '{print $10}' )

echo "Pixel clock: ${PIXEL_CLOCK} MHz"

#WIDTH_VIR=$( echo ${MODELINE} | awk '{print $18}' )
#HEIGHT_VIR=$( echo ${MODELINE} | awk '{print $22}' )
#EM_FREQ=$( echo "scale=4; $WIDTH_VIR * $HEIGHT_VIR * $FPS / 1000000" | bc )

EM_FREQ=$( echo "scale=4; $PIXEL_CLOCK * 7" | bc )

echo "EM Frequency: ${EM_FREQ} MHz"


