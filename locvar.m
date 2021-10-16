function [varian,rkorig,sinvm] = locvar(window)
    %UNTITLED Summary of this function goes here
    %   Detailed explanation goes here
    [~,~,c] = size(window);
    kvals=single(zeros(c,1));
    sigsqvals=single(zeros(c,1));
    for i=1:1:c
        [kvals(i,1),sigsqvals(i,1)]=findreq(window(:,:,i));
    end
    rkvals=kvals .^ 0.5;
    rkm = mean(rkvals);
    sinvm=mean(1 ./ sigsqvals);
    ssqinvm = mean(1 ./ (sigsqvals .^ 2));
    divm = mean(rkvals ./ sigsqvals);
    rkorig = rkm*ssqinvm - divm*sinvm;
    rkorig = rkorig/(ssqinvm - sinvm^2);
    varian = single((1/sinvm) - (1/rkorig)*(rkm/sinvm));
end

