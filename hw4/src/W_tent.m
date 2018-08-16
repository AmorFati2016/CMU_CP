function [ z ] = W_tent( z, Zmin, Zmax )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
z = 0:1:255;
z = double(z) /255;
for i = 1:256
    if z(i)>=Zmin && z(i)<=Zmax
        z(i) = max(z(i),1-z(i));
    else
        z(i) =0;
    end
end

end