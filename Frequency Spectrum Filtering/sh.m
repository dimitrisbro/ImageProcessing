function [F2]=sh(F)
    a=zeros(128,128);
    b=zeros(128,128);
    c=zeros(128,128);
    d=zeros(128,128);
    for i=1:128
        for j=1:128
            a(i,j)=F(i,j);
            b(i,j)=F(i,j+128);
            c(i,j)=F(i+128,j);
            d(i,j)=F(i+128,j+128);
        end
    end
    F2=[d c; b a];
    
end