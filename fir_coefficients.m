% fir_coefficients.m
% FIR Filter Coefficients using Hamming window
N = 7;                % Filter order (7 = 8 taps)
Fc = 0.3;             % Cutoff frequency (normalized 0 to 1)
b = fir1(N, Fc, 'low', hamming(N+1));  % Generate coefficients
disp('FIR Filter Coefficients:');
disp(b);