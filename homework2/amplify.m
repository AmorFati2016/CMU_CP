function [video_band_filtered] = amplify(video_band_filtered,pyrSize,lamda,alpha)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明

pyrH = size(pyrSize,1);

delta = lamda/8/(1+alpha);

exaggeration_factor = 2;

% compute the representative wavelength lambda for the lowest spatial
% freqency band of Laplacian pyramid

lambda = (pyrSize(1,1)^2 + pyrSize(1,2)^2).^0.5/3;
start = 1;
endd = 0;
for h = pyrH:-1:1
    endd = endd + pyrSize(h,1)*pyrSize(h,2);
    % compute modified alpha for this level
    currAlpha = lambda/delta/8 - 1;
    currAlpha = currAlpha*exaggeration_factor;
    
    if (h == pyrH || h == 1) % ignore the highest and lowest frequency band
        video_band_filtered(start:endd,:,:) = 0;
    elseif (currAlpha > alpha)  % representative lambda exceeds lambda_c
        video_band_filtered(start:endd,:,:) = alpha*video_band_filtered(start:endd,:,:);
    else
        video_band_filtered(start:endd,:,:) = currAlpha*video_band_filtered(start:endd,:,:);
    end
    
    start = start + endd;
    % go one level down on pyramid,
    % representative lambda will reduce by factor of 2
    lambda = lambda/2;
end
end

