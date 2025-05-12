clc;
clear;
close all;


x = [1 2 3 4]; % Input signal
N = length(x);
n=0:N-1;
X = u_dft(x);

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

function X = u_dft(x)
    N = length(x);
    X = zeros(1, N);
    for k = 0:N-1
        for n = 0:N-1
            X(k+1) = X(k+1) + x(n+1) * exp(-1j * 2 * pi * k * n / N);
        end
    end
end
