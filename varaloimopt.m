function [Iout] = varaloimopt(I,K,winsz)
    %SEGMENTATION Summary of this function goes here
    %   Detailed explanation goes here
    D=dctmtx(K);
    [a,b]=size(I);
    channels = single(zeros(a,b,K^2-1));
    for i=1:1:K
        for j=1:1:K
            if i~=1 || j~=1
                channels(:,:,(i-1)*K+j-1) = conv2(I,D(i,:)'*D(j,:),'same');
            end
        end
    end
    disp(num2str(a));
    disp(num2str(b));
    Iout=single(zeros(a,b));
    rootk=single(zeros(a,b));
    varmean=single(zeros(a,b));
    ordmom1=integralim(channels,winsz);
    ordmom2=integralim(channels.^2,winsz);
    ordmom3=integralim(channels.^3,winsz);
    ordmom4=integralim(channels.^4,winsz);
    
    varalochans=ordmom2 - ordmom1.^2;
    varalochans(varalochans<0.01)=0.01;
    kuralochans=(ordmom4 - 4*(ordmom3 .* ordmom1) + 6*(ordmom2 .* (ordmom1.^2)) - 3*(ordmom1.^4)) ./ (varalochans.^2);
    kuralochans = kuralochans-3;
    kuralochans=single(kuralochans>0) .* kuralochans;
    
    rootkurchans=kuralochans.^0.5;
    rootkurmean=mean(rootkurchans,3);
    varmean    =mean(1./varalochans,3);
    varsqmean  =mean(1./(varalochans.^2),3);
    divmean    =mean(rootkurchans./varalochans,3);
    middle=varsqmean-varmean.^2;
    %middle(abs(middle)<0.01)=0.01;
    rootk = ((rootkurmean .* varsqmean) - (divmean .* varmean))./middle;
    rootk = single(rootk>0) .* rootk;
    Iout= single((1 - rootkurmean./rootk)./varmean);
    
    idx=rootk<median(rootk(:));
    Iout(idx) = single(1 ./ varmean(idx));
    Iout(Iout<0) = 0;
    Iout(middle<0.001)=0;
end

