clc;
clear;
close all;

tic;
I1 = Tiff('data/tn1.tif','r');
figure(1);
subplot(2,1,1);
imshow(read(I1));
title('Success, i.e; true negative');
temp = rgb2gray(read(I1));
Ia2 = double(temp);
[matrvar] = varaloimopt(Ia2,4,17);
matrvar2=matrvar;
matrvar2(matrvar2<=0.01) = 0;
subplot(2,1,2);
imshow(mat2gray(matrvar2));
toc;

tic;
I1 = Tiff('data/tn2.tif','r');
figure(2);
subplot(2,1,1);
imshow(read(I1));
title('Success, i.e; true negative');
temp = rgb2gray(read(I1));
Ia2 = double(temp);
[matrvar] = varaloimopt(Ia2,4,17);
matrvar2=matrvar;
matrvar2(matrvar2<=6) = 0;
subplot(2,1,2);
imshow(mat2gray(matrvar2));
toc;

%result = failed (False positive)