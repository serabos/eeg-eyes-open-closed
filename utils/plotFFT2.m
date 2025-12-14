function plotFFT2(X_fft, Fs)
%
% plotFFT2(X_fft, Fs)
%
%   Helper function to plots the absolute FFT
%
%       X_fft = the one-sided amplitude spectrum of the
%               Fast Fourier Transform of a signal, e.g. using ssfft()
%       Fs = sampling frequency of the original signal
%

L = length(X_fft);

% Construct frequency axis (0 - 0.5Fs)
f_fft = 0.5*Fs*(0:L-1)/L;

plot(f_fft, X_fft)

% % The following is commented in case this is used within a motage 
% % display, where you might not want to label every set of axes.
% % Uncomment to label axis within this function
% xlabel('Frequency (Hz)')

% % Example of setting the axis limits (zooming in/out)
% xlim([2 40])

end
