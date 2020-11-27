clc;
clear;
close all;

im=imread('aerial.tiff');

%Expantion 0-255
max1=max(max(im));
min1=min(min(im));
img = 255/double((max1-min1))*(im-min1);
%img = uint8(255 * mat2gray(im));

% subplot(121)
% histogram(im)
% title('Αρχικό Ιστόγραμμα')
% subplot(122)
% histogram(img)
% title('Ιστόγραμμα Μετασχηματισμένης')
%figure

subplot(341);
imshow(img);
title('Image');

%2D-fft
fft1D=@(z) fft(z,[],1).';
F=fft1D(fft1D(img));
subplot(342);
imshow(F);
title('FFT');

%fft-shift
F2=sh(F);
subplot(343);
imshow(F2);
title('Shifted FFT');

%linear and logarithmic representation
F2 = abs(F2); 
F3 = log(F2+1); 
F2 = mat2gray(F2);
F3 = mat2gray(F3);
subplot(344)
imshow(F2)
title('Linear')
% figure
% subplot(121)
% imshow(F2)
% title('')
% subplot(122)
% imshow(F3)
% title('Λογαριθμική')
% figure
subplot(345)
imshow(F3)
title('Logarithmic')

%Filtro
H=filtro();
subplot(346);
imshow(mat2gray(log(abs(H)+1)));
title('log filtro');

subplot(347);
filtered=H.*F;
imshow(mat2gray(abs(filtered)));
title('Linear filter*image');

subplot(348);
imshow(mat2gray(log(abs(filtered)+1)));
title('Logarithmic filter*image');

shfiltered=sh(filtered);
subplot(3,4,9);
imshow(mat2gray(log(abs(shfiltered)+1)))
title('Shifted Filtered');

%2D-ifft
ifft1D=@(z) ifft(z,[],1).';
iim=ifft1D(ifft1D(F));

subplot(3,4,10);
p=abs(uint8(iim));
imshow(p)
title('Inverted Image');


