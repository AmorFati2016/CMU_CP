%% load data
Num = 4;
path = 'C:\Users\Amor\Desktop\assgn4\data\exposure_stack\exposure_stack\';
src = imread(strcat(path,'exposure1.jpg'));
for i=1:Num
    data(:,:,:,i) = imread(strcat(path,'exposure',num2str(i),'.jpg'));
end
%% Linearize rendered images
Num = 1:1:Num;
shutter_speed = Num - 1;
shutter_speed = 2.^shutter_speed/2048;
log_shutter_speed = log(shutter_speed);
% define l
l = 30;
% compute weight
w = [linspace(0.02,1,128),linspace(1,0.02,128)];

% sample 
[R, G, B] = sample(data,200);

% gsolve
[gr, lEr] = gsolve(R,log_shutter_speed, l, w);
[gg, lEg] = gsolve(G,log_shutter_speed, l, w);
[gb, lEb] = gsolve(B,log_shutter_speed, l, w);
g = cat(3,gr,gg,gb);
%
hdr_image = avg_map(data,w,log_shutter_speed,g,4);

hdr_image = exp(hdr_image);

Ld = tone_mapping(hdr_image,0.3);


