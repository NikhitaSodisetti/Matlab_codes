clc;
clear;
close all;
 
% effect of upsampling in frequency domain

freq=[0 0.45 0.5 1];
mag=[0 1 0 0];
x=fir2(99,freq,mag);
[xz,w]=freqz(x,1,512);
L=input('Enter the upsampling factor');
subplot(211)
plot(w/pi,abs(xz))
title('100523735055 Input Sequence')
xlabel('Frequency');
ylabel('Magnitude');
y=zeros(1,L*length(x));
y(1:L:length(y))=x;
[yz,w]=freqz(y,1,512);
subplot(212)
plot(w/pi,abs(yz));
title('Output Spectrum')
xlabel('Frequency');
ylabel('Magnitude')


% effect of downsampling in frequency domain

M=input('Enter downsampling  factor');
freq=[0 0.45 0.5 1];
mag=[0 1 0 0];
x=fir2(101,freq,mag);
[xz,w]=freqz(x,1,512);
figure
subplot(211)
plot(w/pi,abs(xz));
xlabel('Frequency');
ylabel('Magnitude')
title('100523735055 Input Sequence')


y=x(1:M:length(x));
[yz,w]=freqz(y,1,512);
subplot(212)
plot(w/pi,abs(yz));
xlabel('Frequency');
ylabel('Magnitude')
title('Output Spectrum')
