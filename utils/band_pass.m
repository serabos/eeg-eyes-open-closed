function y = band_pass(Fs)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% y = high_pass(Fs)
%
%   Helper function to design a high pass filter

% Filter order (number of coefficients to generate)
N_filt = 256;

% Nyquist frequency
Nyq = Fs / 2;

% Filter frequency breakpoints (2-2.1Hz - 40-4-.1Hz imperfect, but necessary to 
% find a solution).
f_filt = [ 0 2/Nyq 2.1/Nyq 40/Nyq 40.1/Nyq 1];

% Filter magnitude breakpoints
m_filt = [ 0 0 1 1 0 0];

b_k = fir2(N_filt, f_filt, m_filt);

% Plot the filter kernel (b_k co-efficients)
figure
plot(b_k)
ylabel('b_k')
xlabel('Filter taps (k)')
title('Band Pass Filter Design')

% Plot the frequency response of the filter
figure
freqz(b_k)

y = b_k;

