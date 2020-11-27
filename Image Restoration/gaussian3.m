function [imn,SNR]=gaussian3(im,m,s)
    array_gaussian_noise1=m+uint8(abs(randn(257,255)*sqrt(s)));
    array_gaussian_noise2=m+uint8(abs(randn(257,255)*sqrt(s)));
    array_gaussian_noise3=m+uint8(abs(randn(257,255)*sqrt(s)));
    imn(:,:,1)=im(:,:,1)+array_gaussian_noise1;
    imn(:,:,2)=im(:,:,2)+array_gaussian_noise2;
    imn(:,:,3)=im(:,:,3)+array_gaussian_noise3;
    noisy=double(im)-double(imn);
    signal=var(double(im(:)));
    noise=var(double(noisy(:)));
    SNR=10*log10(signal/noise);
end
