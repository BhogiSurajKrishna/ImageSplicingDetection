clc;
clear;
close all;

tic;
I1 = Tiff('data/fp1.tif','r');
figure(1);
subplot(2,1,1);
imshow(read(I1));
title('original');
temp = rgb2gray(read(I1));
Ia2 = double(temp);
[matrvar] = varaloimopt(Ia2,4,17);
matrvar2=matrvar;
matrvar2(matrvar2<0.1) = 0;
subplot(2,1,2);
imshow(mat2gray(matrvar2));
title('noise estimate');
toc;

tic;
I1 = Tiff('data/fp2.tif','r');
figure(2);
subplot(2,1,1);
imshow(read(I1));
title('original');
temp = rgb2gray(read(I1));
Ia2 = double(temp);
[matrvar] = varaloimopt(Ia2,4,17);
matrvar2=matrvar;
matrvar2(matrvar2<0.1) = 0;
subplot(2,1,2);
imshow(mat2gray(matrvar2));
title('noise estimate');
toc;

tic;
I1 = Tiff('data/fp3.tif','r');
figure(3);
subplot(2,1,1);
imshow(read(I1));
title('original');
temp = rgb2gray(read(I1));
Ia2 = double(temp);
[matrvar] = varaloimopt(Ia2,4,17);
matrvar2=matrvar;
matrvar2(matrvar2<0.01) = 0;
B=uint8(matrvar2>0);
matrvar2=single(bwareaopen(B,50)) .* matrvar2;
subplot(2,1,2);
imshow(mat2gray(matrvar2));
title('noise estimate');
toc;

tic;
I1 = Tiff('data/fp4.tif','r');
figure(4);
subplot(2,1,1);
imshow(read(I1));
title('As seen, the textured and smooth regions have different intrinsic noise');
temp = rgb2gray(read(I1));
Ia2 = double(temp);
[matrvar] = varaloimopt(Ia2,4,17);
matrvar2=matrvar;
matrvar2(matrvar2<=0.01) = 0;
subplot(2,1,2);
imshow(mat2gray(matrvar2));
toc;