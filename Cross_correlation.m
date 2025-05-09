clc;
clear;

x = input('Enter the first sequence: ');
h = input('Enter the second sequence: ');


% Length of sequences
N = max(length(x), length(h));

x = [x zeros(1, N - length(x))];
h = [h zeros(1, N - length(h))];

y = zeros(1, N);
ny=0:length(y)-1;

for i=1:N
    hm=circshift(h,[0,i-1]);
    y(i)=sum(x.*hm);
end

disp('Circular Convolution result:');
disp(y);

nx=0:length(x)-1;
subplot(311);
stem(nx,x);
title('100523735055 Input sequence');
xlabel('Time');
ylabel('Amplitude');

nh=0:length(h)-1;
subplot(312);
stem(nh,h);
title('Input impulse sequence');
xlabel('Time');
ylabel('Amplitude');

subplot(313);
stem(ny,y);
title('Linear convolution');
xlabel('Time');
ylabel('Amplitude');
