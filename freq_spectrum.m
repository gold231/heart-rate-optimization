function [f,mx] = freq_spectrum(w1)
fs = 1000;
nfft = 1024; 
X = fft(w1,nfft);
X = X(1:nfft/2);
mx = 20*log10(abs(X));
f = (0:nfft/2-1)*fs/nfft;