%% parameters
FileNum = 3;
root = 'C:\Users\Amor\Desktop\assgn4\data\exposure_stack\exposure_stack\';
filename = 'exposure';
format = '.nef';

%% Develop RAW images

%DevelopRAWimages(root,'exposure','.nef',FileNum);

%% Linearize rendered images
% load jpg

img= imread(strcat(root,filename,num2str(1),'.jpg'));
%data = double(zeros(size(img,1),size(img,2),size(img,3),3));
for i=1:3
     
    img= imread(strcat(root,filename,num2str(i+7),'.jpg'));
    %img = im2double(img);
    data(:,:,:,i) = img(:,:,:);
end
% do linear for jpg file
w = W_tent(1:256,0.01,0.99);
Data_linear = linearRenderImage(data,FileNum,w);

%% Merge exposure stack into HDR image
Num = 1:1:FileNum
Num = Num -1;
sp = 2.^Num/2048;
% using linear merging equa.(5)
LinearMerge(data,Data_linear,sp,w,FileNum);

% using logarithmic merging equa. (6)
LogarithmicMerging(data,Data_linear,sp,w,FileNum);



