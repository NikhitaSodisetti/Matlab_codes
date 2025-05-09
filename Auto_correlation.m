
x = input('Enter input sequence '); 
N = length(x);

Rxx = zeros(1, 2*N-1);

for k = -(N-1):(N-1)
    sum = 0;
    for n = 1:N
        if (n+k >= 1) && (n+k <= N)
            sum = sum + x(n) * x(n+k);
        end
    end
    Rxx(k + N) = sum;
end

nx = 0:length(x)-1;
subplot(211);
stem(nx,x);
title('100523735055 Input sequence');
xlabel('Time');
ylabel('Amplitude');

Rxx

lags = -(N-1):(N-1);
subplot(212);
stem(lags, Rxx);
xlabel('Time');
ylabel('Amplitude');
title('Autocorrelation');
