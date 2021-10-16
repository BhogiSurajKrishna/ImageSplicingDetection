function [outim] = integralim(inimg,winsz)
    %INTEGRALIM Summary of this function goes here
    %   Detailed explanation goes here
    [a,b,~] = size(inimg);
    p=ceil((winsz-1)/2);
    Y = single(padarray(inimg,[p+1,p+1],0,'both'));
    Y = cumsum(cumsum(Y,1)/(winsz^2),2);
    outim=Y(1:1:a,1:1:b,:)+Y(2*p+2:1:a+2*p+1,2*p+2:1:b+2*p+1,:)-Y(1:1:a,2*p+2:1:b+2*p+1,:)-Y(2*p+2:1:a+2*p+1,1:1:b,:);
end