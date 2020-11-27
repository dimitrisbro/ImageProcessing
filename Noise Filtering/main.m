clc;
clear all;
close all;

im=mat2gray(imread('clock.tiff'));
subplot(221);
imshow(im);
title('Original Image');

m=0;
s=0.006;
[imn,SNR]=gaussian(im,m,s);
subplot(222);
imshow(imn);
title('Noisy Image');

B=meanf(imn);
subplot(223);
imshow(B);
title('Moving Average');

A=medianf(imn);
subplot(224);
imshow(A);
title('Median');
suptitle('Gaussian Noise')

figure

%--------------------------------------------------------------------------
%Salt & Pepper
subplot(221);
imshow(im);
title('Original Image');

[imsp,posze,poson]=snp(im,0.2);
subplot(222);
imshow(imsp);
title('Noisy Image');

D=meanf(imsp);
subplot(223);
imshow(D);
title('Moving Average');

C=medianf(imsp);
subplot(224);
imshow(C);
title('Median');

suptitle('Salt & Pepper')
figure

%--------------------------------------------------------------------------
[jn,SNR1]=gaussian(im,0,s);
J=snp(jn,0.2);
imshow(J);
title('Gaussian and Salt & Pepper');
figure

mAFJ=meanf(J);
subplot(2,2,1)
imshow(mAFJ)
title('Moving Average Filter');

medJ=medianf(J);
subplot(2,2,2)
imshow(medJ)
title('Median Filter');

bothJ= medianf(meanf(J));
subplot(2,2,3)
imshow(bothJ)
title('1st M.Average, 2nd Median');

bothJ1= meanf(medianf(J));
subplot(2,2,4)
imshow(bothJ1)
title('1st Median, 2nd M.Average');



