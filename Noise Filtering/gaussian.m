function [imn,SNR]=gaussian(im,m,s)

    array_gaussian_noise=m+randn(256)*sqrt(s);
    imn=im+array_gaussian_noise;
    
    th1=imn>1;
    imn(th1)=1;
    th2=imn<0;
    imn(th2)=0;
    
    noisy=im-imn;
    
    ps=sum(sum(im.^2))/(256*256);
    pn=sum(sum(noisy.^2))/(256*256);
    SNR=10*log10(ps/pn);
end
