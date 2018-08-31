function [ frame_ifft_real ] = bandFilter( frame, ratio )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

frame_fft = fft2(frame);

frame_fft_shift = fftshift(frame_fft);

frame_fft_shift_abs = abs(frame_fft_shift);

row = size(frame_fft,1);
col = size(frame_fft,2);

y = -row/2:row/2-1;
x = -col/2:col/2-1;


[x,y]=meshgrid(x,y);

D = sqrt(x.^2 + y.^2);
D = D<ratio;

frame_fft_shift_filter = D.*frame_fft_shift;

frame_ifft_shift = ifftshift(frame_fft_shift_filter);
frame_ifft = ifft2(frame_ifft_shift);
frame_ifft_real = real(frame_ifft);

imshow(frame_ifft_real);
end

