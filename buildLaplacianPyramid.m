function [ pyramid ] = buildLaplacianPyramid( frame, pyrH )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% build pyramid
pyramid = cell(pyrH,1);
for i=1:pyrH-1
    % gauss filter
    frame_gauss = imgaussfilt(frame,3);
    diff = frame - frame_gauss;
    % downsample
    frame_gauss_down = frame_gauss(1:2:size(frame_gauss,1),1:2:size(frame_gauss,2));
    frame = frame_gauss_down;
    pyramid{i} = diff;
end
pyramid{pyrH} = frame_gauss_down;
end

