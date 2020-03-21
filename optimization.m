clc,clear
a1 = open('project3_data_1.mat');
w1 = a1.data;
fs1 = a1.fs;

t1 = (1:length(w1))/fs1;
w11 = filter(w1);
w12 = filter(w11);

[ff,mx] = freq_spectrum(w1);
[ff1,mx1] = freq_spectrum(w11);
[ff2,mx2] = freq_spectrum(w12);

figure(1);clf;
subplot(2,1,1);
plot(t1,w1);grid on;hold on
title('waveform');
legend('original');
xlabel('time, s');ylabel('amplitude')
subplot(2,1,2);
plot(ff,mx,'r');grid on;hold on
title('frequency spectrum');
legend('original','after filter');
xlabel('frequency, Hz');ylabel('amplitude, dB')

figure(2);clf
subplot(2,1,1);
plot(t1,w11);grid on
legend('after filter');
xlabel('time, s');ylabel('amplitude')
subplot(2,1,2);
plot(ff1,mx1,'r');grid on;hold on
title('frequency spectrum');
legend('after filter');
xlabel('frequency, Hz');ylabel('amplitude, dB')

figure(3);clf;
subplot(2,1,1);
plot(t1,w12);grid on;hold on
title('waveform');
legend('highremove filter');
xlabel('time, s');ylabel('amplitude')
subplot(2,1,2);
title('frequency spectrum')
plot(ff2,mx2,'r');grid on;hold on
legend('highremove filter');
xlabel('frequency, Hz');ylabel('amplitude, dB')

figure(4);clf
plot(t1,w12);grid on;hold on

[maxtab,mintab] = peakdet(w1, 100, t1);
% plot(mintab(:,1), mintab(:,2), 'g*');
plot(maxtab(:,1), maxtab(:,2), 'r*');
title('heart rate')
xlabel('time, s');ylabel('amplitude')

s = 0; n = 0;
for i=2:length(maxtab(:,1))
    s = s + maxtab(i,1) - maxtab(i-1,1);
    n = n + 1;
end
f_heart = n/s