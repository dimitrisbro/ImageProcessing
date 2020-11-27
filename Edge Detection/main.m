clc;
clear all;
close all;

img=imread('factory.jpg');
img = rgb2gray(img);
imshow(img);
figure
img = double (img);
%Prewitt Masks
[a,b,c]=prewitt(img);
subplot(221);
imshow(a);
title('Masks');
subplot(222);
imshow(b);
title('Threshold from Hist');
subplot(223);
imshow(c);
title('Threshold from Average');
ed=edge(img,'prewitt');
subplot(224);
imshow(ed);
title('Matlab');
suptitle('Prewitt')
figure

%Sobel Masks
[a1,b1,c1]=sobel(img);
subplot(221);
imshow(a1);
title('Mask');
subplot(222);
imshow(b1);
title('Threshold from Hist');
subplot(223);
imshow(c1);
title('Threshold from Average');
ed=edge(img,'Sobel');
subplot(224);
imshow(ed);
title('Sobel Matlab');
suptitle('Sobel')

% figure 
% hist(a)
% figure 
% hist(a1)