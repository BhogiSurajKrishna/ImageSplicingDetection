function [outimg] = segmentation(inimg,k,thres,p1,p2)
    %SEGMENTATION Summary of this function goes here
    %   Detailed explanation goes here
    [L,centers] = imsegkmeans(inimg,k);
    outimg=centers(L);
    outimg=double(outimg>thres) .* outimg;
    i1 = bwareaopen(double(outimg>0),p1);
    i1 = imclose(i1,ones(p2));
    outimg = double(i1) .* outimg;
end

