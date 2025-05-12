clc;
clear;
close all;


x = rand(1,16); % Input signal
N = 16;
n=0:N-1;
X = fft_16(x);

subplot(311)
stem(n,x)
title("Input signal")
xlabel("Time")
ylabel("Amplitude")

subplot(312)
stem(n,abs(X))
title(" signal")
xlabel("Time")
ylabel("Amplitude")

subplot(313)
stem(n,angle(X))
title(" signal")
xlabel("Time")
ylabel("Amplitude")



function X = fft_16(x)
    
    N=16;

    % Bit-reversal permutation
    x = bitrevorder(x);
    
    % FFT computation (iterative radix-2)
    X = x;
    stages = log2(N);
    for s = 1:stages
        m = 2^s;
        wm = exp(-1j * 2 * pi / m);
        for k = 1:m:N
            for j = 0:(m/2 - 1)
                t = wm^j * X(k + j + m/2);
                u = X(k + j);
                X(k + j) = u + t;
                X(k + j + m/2) = u - t;
            end
        end
    end
end
