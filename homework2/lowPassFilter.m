function [outputArg1] = lowPassFilter(lapPyr,videoInfo)
%UNTITLED5 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

frame_num = videoInfo.Frams;
for i=1:frame_num
    for j=1:pyrH
        lapPyr{1,1,i}{j} = bandFilter(lapPyr{1,1,i}{j},50);
        lapPyr{1,2,i}{j} = bandFilter(lapPyr{1,2,i}{j},50);
        lapPyr{1,3,i}{j} = bandFilter(lapPyr{1,3,i}{j},50);
    end
end

outputArg1 = lapPyr;
end

