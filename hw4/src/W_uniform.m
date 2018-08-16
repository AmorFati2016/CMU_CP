function [ z ] = W_uniform( z, Zmin, Zmax )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
z(z<Zmin) = 0;
z(z>Zmax) = 0;
z(z>=Zmin) = 1;
z(z<=Zmax) = 1;

end

