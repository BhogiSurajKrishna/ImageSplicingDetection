clc;
clear;
close all;
%spl8
tic;
I1 = Tiff('data/tp1.tif','r');
figure(1);
imshow(read(I1));
title('A-original');
temp = rgb2gray(read(I1));
Ia2 = double(temp);
[matrvar] = varaloimopt(Ia2,4,17);
matrvar2=matrvar;
matrvar2(matrvar2>100) = 0;
figure(2);
imshow(mat2gray(matrvar2));
title('A-noise estimate');
toc;

tic;
I1 = Tiff('data/tp2.tif','r');
figure(3);
imshow(read(I1));
title('B-original');
temp = rgb2gray(read(I1));
Ia2 = double(temp);
[matrvar] = varaloimopt(Ia2,4,17);
matrvar2=matrvar;
matrvar2(matrvar2>100) = 0;
figure(4);
imshow(mat2gray(matrvar2));
title('B-noise estimate');
toc;

tic;
I1 = Tiff('data/tp3.tif','r');
figure(5);
imshow(read(I1));
title('C-original');
temp = rgb2gray(read(I1));
Ia2 = double(temp);
[matrvar] = varaloimopt(Ia2,4,17);
matrvar2=matrvar;
matrvar2(matrvar2<=0.01) = 0;
figure(6);
imshow(mat2gray(matrvar2));
title('C-noise estimate(detected the splice but also smooth region in original have different noise distribution than textured(window)');
toc;

tic;
figure(7);
Ia1 = imread('data/tp4.png');
subplot(2,1,1);
imshow(Ia1);
temp = rgb2gray(Ia1);
Ia2=double(temp);
[matrvar] = varaloimopt(Ia2,4,17);
matrvar2=matrvar;
matrvar2(matrvar2<=15) = 0;
subplot(2,1,2);
imshow(mat2gray(matrvar2));
toc;

tic;
figure(8);
Ia1 = imread('data/tp5.png');
subplot(2,1,1);
imshow(Ia1);
temp = rgb2gray(Ia1);
Ia2=double(temp);
[a,b]=size(Ia2);
[matrvar] = varaloimopt(Ia2,4,17);
matrvar2=matrvar;
matrvar2(matrvar2>=100) = 0;
subplot(2,1,2);
imshow(mat2gray(matrvar2));
toc;
