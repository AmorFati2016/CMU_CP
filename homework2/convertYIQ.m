function [outputArg1] = convertYIQ(video_frames_double)
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

frameNum = size(video_frames_double,4);
frameDim = size(video_frames_double,3);
if frameDim ~= 3
    display('video frame format error, which must be 3 channels RGB data.');
    return;
end
for i=1:frameNum
    video_frames_double(:,:,:,i) = rgb2ntsc(video_frames_double(:,:,:,i));
end
videoFramsYIQ = video_frames_double;

outputArg1 = videoFramsYIQ;
end

