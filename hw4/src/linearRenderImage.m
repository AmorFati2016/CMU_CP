function [ data ] = linearRenderImage( data,FileNum, w)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
Num = 1:1:FileNum
Num = Num -1;
shutter_speed = 2.^Num/2048;
log_shutter_speed = log(shutter_speed);
% define l
l = 30;
% compute weight
%w = [linspace(0.02,1,128),linspace(1,0.02,128)];

% sample 
[R, G, B] = sample(data,500);

% gsolve
[gr, lEr] = gsolve(R,log_shutter_speed, l, w);
[gg, lEg] = gsolve(G,log_shutter_speed, l, w);
[gb, lEb] = gsolve(B,log_shutter_speed, l, w);

data(:,:,1,:) = exp(gr(data(:,:,1,:)+1));
data(:,:,2,:) = exp(gg(data(:,:,2,:)+1));
data(:,:,3,:) = exp(gb(data(:,:,3,:)+1));

end

