function DevelopRAWimages( root,filename,format,FileNum )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

for i=1:FileNum
    path = strcat(root,filename,num2str(i),format);
    disp(strcat('do___ ',path));
    system([strcat(root,'dcraw.exe -4 -T -w -o 1 -q 3 ',32,path)]);
end

end

