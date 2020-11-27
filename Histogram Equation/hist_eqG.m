function [HIm]=hist_eqG(im)

    numofpixels=size(im,1)*size(im,2);
    HIm=uint8(zeros(size(im,1),size(im,2)));
    freq=zeros(256,1);
    probf=zeros(256,1);
    probc=zeros(256,1);
    cum=zeros(256,1);
    output=zeros(256,1);
    n=1:256;
    %h freq metra poses fores emfanizetai mia timh apo to [0,255]
    %h probf ypologizei thn pithanothta emfanishs kath timhs
    for i=1:size(im,1)
        for j=1:size(im,2)
            value=im(i,j);
            freq(value+1)=freq(value+1)+1;
            probf(value+1)=freq(value+1)/numofpixels;
        end
    end

    sum=0;
    no_bins=255;
    %athroistikh synarthsh ktanomhs. 
    for i=1:size(probf)
       sum=sum+freq(i);
       cum(i)=sum;
       probc(i)=cum(i)/numofpixels;
       output(i)=round(probc(i)*no_bins);
    end

    for i=1:size(im,1)
        for j=1:size(im,2)
                HIm(i,j)=output(im(i,j)+1);
        end
    end
end