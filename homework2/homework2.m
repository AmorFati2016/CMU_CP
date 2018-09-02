
%% initial
path = 'C:\Users\Amor\Desktop\assgn2\data\face.mp4';
video_frames_double = initials(path);

%% convert each of the frames to the YIQ color space
video_Frames_YIQ = convertYIQ(video_frames_double);

%% create the laplace pyramid
filterSize = 5;
[video_laplacianPyramid ,pyrSize] = buildVideoLaplacianPyramid(video_Frames_YIQ,videoInfo,filterSize);

%% bandFilter
video_band_filtered  = lowPassFilter(video_laplacianPyramid,wl,wh);


%% amplify

video_band_filtered_amplify = amplify(video_band_filtered,pyrSize,50,150);

    







