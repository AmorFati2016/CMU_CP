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

frame_num = 10;
videoFramesDouble = im2double(firstFrame);

%convert each of the frames to the YIQ color space
videoFramsYIQ = rgb2ntsc(videoFramesDouble);

% create the laplace pyramid
filterSize = 5;
[width , height] = size(firstFrame);

% compute the height of pyramid
pyrH = computePyrHeight(width,height,filterSize);

% build lapacian pyramid
lapPyr = cell(1,3,frame_num);
% build pyramid for r g b channels

temp = buildLaplacianPyramid(videoFramsYIQ(:,:,1),pyrH);

% for i= 1: frame_num
%     lapPyr{:,1,i} = buildLaplacianPyramid(videoFramsYIQ(:,:,1),pyrH);
%     lapPyr{:,2,i} = buildLaplacianPyramid(videoFramsYIQ(:,:,2),pyrH);
%     lapPyr{:,3,i} = buildLaplacianPyramid(videoFramsYIQ(:,:,3),pyrH);
% end
% 
% % bandfilter
% for i=1:frame_num
%     for j=1:pyrH
%         lapPyr{1,1,i}{j} = bandFilter(lapPyr{1,1,i}{j},50);
%         lapPyr{1,2,i}{j} = bandFilter(lapPyr{1,2,i}{j},50);
%         lapPyr{1,3,i}{j} = bandFilter(lapPyr{1,3,i}{j},50);
%     end
% end


%% amplify


%% reconstruction
out = temp{pyrH};
for i=pyrH-1:-1:1
    out  = temp{i} + imresize(out,[size(temp{i},1),size(temp{i},2)],'bilinear');
end

imshow(out);
    







