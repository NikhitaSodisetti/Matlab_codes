clc;
clear;
close all;

n=0:50;
x=sin(2*pi*0.031*n);
subplot(211)
stem(n,x)
title('Input Sequence')
xlabel('Time')
ylabel('Amplitude')

y=zeros(1,2*length(x));
y(1:2:length(y))=x;
subplot(212)
stem(n,y(1:length(x)))
title('Upsampling by 2 Sequence')
xlabel('Time')
ylabel('Amplitude')