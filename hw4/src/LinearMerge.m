function [hdr] = LinearMerging(data,Data_linear,tk,w,FileNum)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明

for d = 1:3
    for i=1:FileNum
        up =  w(data(:,:,d,i))*Data_linear(:,:,d,i)/tk(i);
        down = w(data(:,:,d,i));
    end
    hdr(:,:,d) = up / down;
end
end

