function [Iout] = varaloimg(I,K,winsz)
    %SEGMENTATION Summary of this function goes here
    %   Detailed explanation goes here
    D=dctmtx(K);
    [a,b]=size(I);
    %filtnums = reshape(1:K^2,K,K);
    channels = zeros([a,b,K^2-1],'single');
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
    sinvm1=single(zeros(a,b));
    p=ceil((winsz-1)/2);
    Ipad = padarray(channels,[p,p],0,'both');
    for i=1:1:a
        for j=1:1:b
            window=Ipad(i:2*p+i,j:2*p+j,:);
            [Iout(i,j),rootk(i,j),sinvm1(i,j)] = locvar(window);
        end
    end
    idx=rootk<median(rootk(:));
    Iout(idx) = single(1 ./ sinvm1(idx));
    idx = Iout<0;
    Iout(idx) = single(1 ./sinvm1(idx));
end

