clc;
clear all;
close all;

im = imread('lenna.jpg');
[N1,N2,N3] = size(im);
imshow(im);
title('Original Image');

[imn,snr] = gaussian3(im,0,950);
figure
imshow(uint8(imn));
title('Image with Noise');


for i = 1:3
    imw(:,:,i) = wiener2(imn(:,:,i),[3 3]);
end

figure
imshow(imw);
title('Wiener Matlab');


noisy = double(imn) - double(im); % g(x,y) = f(x,y) + n(x,y)
Pn = double(noisy).^2;   


Pg = double(imn).^2;


Pf=Pg-Pn;

Hw = Pf./(Pf + Pn); %wiener filter

hw = ifft(ifft(Hw,[],2),[],1);

F=fft(fft(imn,[],1),[],2);
Fnew = F.*Hw;
f = abs(ifft(ifft(Fnew,[],2),[],1));
figure;
imshow(uint8((f)));
title('Custom Wiener')
figure

lenna_shifted=fftshift(F);


mask=lenna_shifted(26:50,176:200,:);
imshow(mask)
x=abs(mask);

D=[];
for k=1:10
    C=[];
    for l=1:10
        C=[C x];
    end
    C=[C x(:,1:5,:)];
    D=[D; C];
end
c=[];
for l=1:10
    c=[c x(1:7,:,:)];
end
c=[c x(1:7,1:5,:)];
D=[D; c];

Pn2 = D.^2/257/255;
G=abs(F);
FF=G-D;

Pff = FF.^2/257/255;

Hw2=Pff./(Pff+Pn2);
newFF=F.*Hw2;

newim=abs(ifft2(newFF));

figure;
imshow(uint8(newim));
title('Unknown Noise Weiner')

%% Second
clc;
clear all;
close all;
im = imread('lenna.jpg');
figure

kr = zeros(size(im,1),size(im,2));
kr(129,127) = 1;

y = psf(kr);%kroystikh apokrish
Y = fft2(y);%apokrish syxnothtas


imshow(y,[]);
title('Kroustikh apokrish');
figure


imshow(abs(fftshift(Y)),[]);
title('Apokrish syxnothtas');
figure

y2(:,:,1) = fft2(psf(im(:,:,1)));
y2(:,:,2) = fft2(psf(im(:,:,2)));
y2(:,:,3) = fft2(psf(im(:,:,3)));
imshow(psf(im),[])
title('Lenna PSF');
figure


l=1;
e=[-1 0 0.5 1 1.5 2 2.5 3 3.5 4 4.5 5];
err=zeros(size(e));
for m=e
    for i=1:257
        for j=1:255
            if abs(Y(i,j))>m
                Hbar(i,j)=1/Y(i,j);
            else
                Hbar(i,j)=0;
            end
        end
    end


    FF(:,:,1)=y2(:,:,1).*Hbar;
    FF(:,:,2)=y2(:,:,2).*Hbar;
    FF(:,:,3)=y2(:,:,3).*Hbar;

    ff=fftshift(ifft2((FF)));
    if l==1
        ff1=ff;
    elseif l==3
        ff2=ff;
    elseif l==12
        ff3=ff;
    end
    err(l) = immse(im,uint8(ff)); %mse
    l=l+1;
end

subplot(131)
imshow(uint8(ff1),[]);
title('No Threshold')
subplot(132)
imshow(uint8(ff2),[]);
title('Threshold = 0.5')
subplot(133)
imshow(uint8(ff3),[]);
title('Threshold = 5')

figure
plot(e,err)
title('MSE')
xlabel('Threshold')
ylabel('Error')
