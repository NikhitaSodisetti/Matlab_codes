clc;
clear;
close all;

f=5;
fs=1000;
t=0:1/fs:1;

x1=sin(2*pi*f*t); %sine
x2=square(2*pi*f*t); % square
x3=sawtooth(2*pi*f*t,0.5); %triangle
x4=sawtooth(2*pi*f*t); % sawtooth
x5=square(2*pi*f*t,10) % <50% duty cycle - pulse

subplot(321)
plot(t,x1)
title("Sine")
subplot(322)
plot(t,x2)
title("Square")
subplot(323)
plot(t,x3)
title("Triangle")
subplot(324)
plot(t,x4)
title("Sawtooth")
subplot(325)
plot(t,x5)
title("Pulse")