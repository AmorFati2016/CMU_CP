function [levels] = computePyrHeight(width,height,size)
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

wid = min(width,height)
levels = 0;
if wid > size
    levels = 1+computePyrHeight(width/2,height/2,size);
end

end

