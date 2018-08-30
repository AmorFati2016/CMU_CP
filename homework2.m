% % load the video file with VideoReader function.
% videoObj = VideoReader('C:\Users\Amor\Desktop\assgn2\data\face.mp4');
% 
% % extract the frames from video file
% videoFrames = read(videoObj);
% % convert them to double-precision in the range [0; 1]
% videoFramesNormal = videoFrames/255;
% 
% firstFrame = videoFrames(:,:,:,1);

firstFrame = imread('first.png');

videoFramesDouble = im2double(firstFrame);
%convert each of the frames to the YIQ color space
videoFramsYIQ = rgb2ntsc(videoFramesDouble);

% create the laplace pyramid
filterSize = 5;
[width , height] = size(firstFrame);

% compute the height of pyramid
pyrH = computePyrHeight(width,height,filterSize);

% build pyramid

pyr = cell(pyrH,3,100);









