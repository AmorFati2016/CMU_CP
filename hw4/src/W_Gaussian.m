function [ z ] = W_Gaussian( z, Zmin, Zmax )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

z = 0:1:255;
z = double(z) /255;
for i = 1:256
    if z(i)>=Zmin && z(i)<=Zmax
        z(i) = exp(-4*(z(i)-0.5)^2/0.5/0.5);
    else
        z(i) =0;
    end
end
end



