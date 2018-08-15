function [pR, pG, pB] = sample(src, delta)
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明
[row, col, dim, num] = size(src);
 y = round(1:row/delta:row)';
 x = round(1:col/delta:col)';
%%
%Assign selected pixel values from different pictures to RGB channels
pts = size(x,1);%number of points selected
pR = zeros(pts, num);
pG = zeros(pts, num);
pB = zeros(pts, num);

for i=1:num %number of pictures
    for j=1:pts %number of points selected
        pR(j,i) = src(y(j),x(j),1,i);
        pG(j,i) = src(y(j),x(j),2,i);
        pB(j,i) = src(y(j),x(j),3,i);
    end
end

end

