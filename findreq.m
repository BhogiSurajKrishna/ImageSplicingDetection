function [k,sigsq] = findreq(wind)
    %BANDFILT Summary of this function goes here
    %   Detailed explanation goes here
    %fftI = fftshift(fftI);
%     [nx,ny]=size(dctI);
%     %f1 = zeros(nx,ny);
%     f2 = zeros(nx,ny);
%     for i=1:nx
%         for j=1:ny
%             dist=((i-1)^2 + (j-1)^2);
%             f1(i,j)=exp(-dist^2/(2*high^2));
%             f2(i,j)=1.0 - exp(-dist^2/(2*low^2));
%         end
%     end
%     start1=(ind-1)*steps + 1;
%     end1 = ind*steps;
%     f2(start1:1:end1,1) = ones(end1-start1+1,1);
%     fin = dctI .* f2;
%     fin = reshape(fin,[dim1,dim2]);
%     fin = idct2(fin);
%     fin = double(fin);
    k=max(0,kurtosis(wind,1,'all')-3);
    sigsq=var(wind,1,'all');
end

