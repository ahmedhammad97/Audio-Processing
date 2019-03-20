clear;
clc;

%Task 1
freq = [0.05 0.1 0.2 0.4 1 2 4 6 8 10 12 14 16 18];
result = [];

for i=1:14
   t = linspace(0,3,3*48000);
   result = [result 0.5*sin(2*pi*t*freq(i)*1000)];
end

result = result';

audiowrite('/home/hammad/Desktop/DspLab/task1.wav',result, 48000);


% Task 2
Fs = 22050;
silence = zeros(1,Fs*0.5);
t = linspace(0,0.5,0.5*22050);
siren = 0.25*sin(2*pi*600*t) + 0.25*sin(2*pi*1400*t);
cycle = [];
for i=1:12
    cycle = [cycle, silence siren];
end
audiowrite('/home/hammad/Desktop/DspLab/task2.wav', cycle, 22050);


% Task 3
seq = input('Enter the sequence... ', 's');
low = [697 697 697 770 770 770 852 852 852 941];
high = [1209 1336 1477 1209 1336 1477 1209 1336 1477 1336];
fs = 20000;
total = [];
for i=1:length(seq)
    char = seq(i);
    if char == '0'
        char = '10';
    end
    t = linspace(0,0.2,0.2*fs);
    audio = 0.15*sin(2*pi*t*low(base2dec(char, 10))) + 0.15*sin(2*pi*t*high(base2dec(char, 10)));
    audio = [audio, zeros(1,0.05*fs)];
    total = [total audio];
end
total = total';
sound(total, fs);
