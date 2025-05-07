clc;
clear;
close all;

fc = 5000; % Carrier frequency (Hz)
fm = 200; % Message frequency (Hz)
Fs = 10000; % Sampling frequency (Hz)
t = 0:1/Fs:0.01; % Time vector (10 ms)
m=cos(2*pi*fm*t); % Message signal
c=cos(2*pi*fc*t); % Carrier signal
dsb_sc=m.*c; % Double Side Band Suppressed Carrier signal

subplot(411)
plot(t,m)
title("Message Signal"); 
xlabel("Time"); 
ylabel("Amplitude")

subplot(412)
plot(t,c)
title("Carrier Signal"); 
xlabel("Time"); 
ylabel("Amplitude")

subplot(413)
plot(t,dsb_sc)
title("Carrier Signal"); 
xlabel("Time"); 
ylabel("Amplitude")

% Design VSB filter
n = length(t);
f = linspace(-Fs/2, Fs/2, n);   % Frequency vector for filter design
Delta_f=50; % Vestigial width
H = zeros(1, n);
% Define VSB filter transfer function in frequency domain
for i = 1:n
    if abs(f(i)-fc) <= fm - Delta_f
        H(i) = 1;
    elseif abs(f(i)-fc) > fm - Delta_f && abs(f(i)-fc) < fm + Delta_f
        % Raised cosine roll-off (simple linear taper)
        H(i) = 0.5*(1+cos(pi*(abs(f(i)-fc)-(fm-Delta_f))/(2*Delta_f)));
    else
        H(i) = 0;
    end
end

% Apply filter in frequency domain
DSB_FFT = fftshift(fft(dsb_sc));
VSB_FFT = DSB_FFT .* H;
vsb = real(ifft(ifftshift(VSB_FFT)));  % Get time-domain signal


subplot(414);
plot(t, vsb); title("Vestigial Side Band Signal"); 
xlabel("Time");
ylabel("Amplitude")