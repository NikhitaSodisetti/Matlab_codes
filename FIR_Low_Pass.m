clc;
clear;
close all;

N=input('Enter length of filter :');
fc=input('Enter cutoff frequency : ');
fs=3*fc;
wc=2*fc/fs;

h1=fir1(N,wc,boxcar(N+1));
h2=fir1(N,wc,bartlett(N+1));
h3=fir1(N,wc,hamming(N+1));
h4=fir1(N,wc,blackman(N+1));
h5=fir1(N,wc,hanning(N+1));

[H1,w]=freqz(h1,1);
[H2,w]=freqz(h2,1);
[H3,w]=freqz(h3,1);
[H4,w]=freqz(h4,1);
[H5,w]=freqz(h5,1);

plot((w*fs)/(pi*2),20*log10(abs(H1)),'r',(w*fs)/(pi*2),20*log10(abs(H2)),'g',(w*fs)/(pi*2),20*log10(abs(H3)),'c',(w*fs)/(pi*2),20*log10(abs(H4)),'k',(w*fs)/(pi*2),20*log10(abs(H5)),'b');
legend('rectangle','triangle','hamming','blackman','hanning');
ylabel('Magnitude');
xlabel('Frequency in Hz');
title('100523735055 Stop Band filter');