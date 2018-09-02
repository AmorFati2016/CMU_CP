function [outputArg1,pyrSize] = buildVideoLaplacianPyramid(videoFramsYIQ,videoInfo,filterSize)
%UNTITLED4 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��


width = videoInfo.width;
height = videoInfo.height;
dim = videoInfo.dims;
frame_num = size(videoFramsYIQ,4);

% compute the height of pyramid
pyrH = computePyrHeight(width,height,filterSize);

% build lapacian pyramid
% build pyramid for r g b channels
[temp,pyrSize] = buildLaplacianPyramid(videoFramsYIQ(:,:,1,1),pyrH)

length = size(temp,1)*size(temp,2);

lapPyr = zeros(length,3,frame_num);

for i= 1: frame_num
    [lapPyr(:,1,i),~] = buildLaplacianPyramid(videoFramsYIQ(:,:,1,i),pyrH);
    [lapPyr(:,2,i),~] = buildLaplacianPyramid(videoFramsYIQ(:,:,2,i),pyrH);
    [lapPyr(:,3,i),~] = buildLaplacianPyramid(videoFramsYIQ(:,:,3,i),pyrH);
end
outputArg1 = lapPyr;
end

