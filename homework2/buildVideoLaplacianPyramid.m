function [outputArg1] = buildVideoLaplacianPyramid(videoFramsYIQ,videoInfo,filterSize)
%UNTITLED4 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��


width = videoInfo.width;
height = videoInfo.height;
dim = videoInfo.dims;
frame_num = videoInfo.Frames;

% compute the height of pyramid
pyrH = computePyrHeight(width,height,filterSize);

% build lapacian pyramid
lapPyr = cell(1,dim,frame_num);
% build pyramid for r g b channels

for i= 1: frame_num
    for d = 1:dim
        lapPyr{:,d,i} = buildLaplacianPyramid(videoFramsYIQ(:,:,d,i),pyrH);
    end
end

outputArg1 = lapPyr;
end

