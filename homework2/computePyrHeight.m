function [levels] = computePyrHeight(width,height,size)
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明

wid = min(width,height)
levels = 0;
if wid > size
    levels = 1+computePyrHeight(width/2,height/2,size);
end

end

