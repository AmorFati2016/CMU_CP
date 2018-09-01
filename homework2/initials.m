function [outputArg1,outputArg2] = initials(path)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明


% load the video file with VideoReader function.
videoObj = VideoReader(path);

% extract the frames from video file
videoFrames = read(videoObj);


[height, width, dims, Frames] = size(videoFrames);
% create struct for information
videoInfo.height = height;
videoInfo.width = width;
videoInfo.dims = dims;
videoInfo.Frames = Frames;
% convert them to double-precision in the range [0; 1]
videoFrames_double = im2double(videoFrames);


outputArg1 = videoInfo;
outputArg2 = videoFrames_double;
end

