clc;
clear all;
close all;

s=load('barbara.mat');
im=s.barbara;
subplot(231);
imshow(im)
title('Original Image')

[nim]=globall(im);
subplot(232);
imshow(nim)
title('Global Hist Equalization')

[nim32]=local(im);
subplot(233);
Img=local(im);
imshow(Img)
title('Local Hist Equalization')

% imHSV=rgb2hsv(im);
% subplot(336);
% imshow(imHSV)
% title('HSV')

imHSI=HSI(im);
subplot(234);
imshow(imHSI)
title('HSI')

nimHSI2(:,:,1)=imHSI(:,:,1);
nimHSI2(:,:,2)=imHSI(:,:,2);
nimHSI2(:,:,3)=hist_eqG(imHSI(:,:,3));
subplot(235);
imshow(nimHSI2)
title('HSI Global Hist')

nimHSI2(:,:,1)=imHSI(:,:,1);
nimHSI2(:,:,2)=imHSI(:,:,2);
nimHSI2(:,:,3)=local(imHSI(:,:,3));
subplot(236);
imshow(nimHSI2)
title('HSI Local Hist')
