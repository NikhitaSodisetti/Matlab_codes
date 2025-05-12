clc;
clear;
close all;



fp=400;
fs=200;
rp=1;
rs=40;
Fs=20*fp;
wp=2*fp/Fs;
ws=2*fs/Fs;
[N,wc]=buttord(wp,ws,rp,rs);
[a,b]=butter(N,wc,'high');
[H,w]=freqz(a,b);
Hmag=abs(H);
subplot(413);
plot((w/pi)*(Fs/2),20*log10(Hmag));
title('High Pass Filter Magnitude Response')
xlabel('Frequency in Hz');
ylabel('Magnitude in dB');


Hphase=angle(H);
subplot(414)
plot((w/pi)*(Fs/2),Hphase);
title('Phase Resopnse ')
xlabel('Frequency in Hz');
ylabel('Phase');













