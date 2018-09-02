function [ pyramid ,pyrSize] = buildLaplacianPyramid( frame, pyrH )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% build pyramid
pyramid = [];
pyrSize = zeros(pyrH,2);
for i=1:pyrH-1
    % gauss filter
    frame_gauss = imgaussfilt(frame,3);
    pyrSize(i,:) = [size(frame_gauss,1),size(frame_gauss,2)];
    diff = frame - frame_gauss;
    % downsample
    frame_gauss_down = frame_gauss(1:2:pyrSize(i,1),1:2:pyrSize(i,2));
    frame = frame_gauss_down;
    pyramid = [pyramid,reshape(diff,1,size(frame_gauss,1)*size(frame_gauss,2))];
end
pyramid = [pyramid,reshape(frame_gauss_down,1,size(frame_gauss_down,1)*size(frame_gauss_down,2))];
end

