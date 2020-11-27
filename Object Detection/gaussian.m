function [imn,n]=gaussian(im,m,s)
    array_gaussian_noise=(m+randn(480,704,3)*sqrt(s));
    n=255*array_gaussian_noise;
    imn=double(im)-n;
end
