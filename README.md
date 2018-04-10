# calc-monitor-em-freq
Calculating EM emission frequency of a monitor.

We can calculate the EM emission frequency of a monitor in the following way.

(1) Check the monitor resolution (true pixel width, hight and the frame rate)
  xrandr | grep "*"

(2) Feed the width, height and frame rate to the cvt command as follows.

cvt width height frame_rate

eg: cvt 1366 768 60

example output:
# 1368x768 59.88 Hz (CVT) hsync: 47.79 kHz; pclk: 85.25 MHz
Modeline "1368x768_60.00"   85.25  1368 1440 1576 1784  768 771 781 798 -hsync +vsync

From this output, we learn that,
The virtual width is 1784.
The virtual height is 798.
Pixel clock frequency is 85.25Hz.


(3) Calculate the EM emission frequency using,

(virtual width) x (virtual height) x (frame rate) 

The result value is nearly equal to the clock frequency.


