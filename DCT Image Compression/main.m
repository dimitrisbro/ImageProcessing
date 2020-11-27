clc;
clear all;
close all;

s=load('flower.mat');
img=s.flower;

%%
subplot(131);
imshow(img);
title('Original Image');

DCT=dct2D(img,256);
subplot(132);
imshow(DCT);
title('DCT of the Image');
DCT32=dct32(img);
subplot(133);
imshow(DCT32);
title('DCT 32x32 of the Image');
figure
%% Mask
[DCT32,mse1]=dct32mask(img);
% subplot(121);
imshow(DCT32);
% title('Mask 5%')
% subplot(122);
% imshow(d);
title('Mask 50%')
figure
p=maskp;
plot(p(10:32),mse1);
xlabel('Percentage')
ylabel('MSE')
figure 
imshow(dct32(img))

%% Threshold
[d1,d2,p,mse2]=dct32th(img);
subplot(121)
imshow(d1)
title('Threshold 50%')
subplot(122)
imshow(d2)
title('Threshold 5%')
figure
plot(p,mse2)
xlabel('Percentage')
ylabel('MSE')
