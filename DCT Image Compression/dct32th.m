function [d1,d2,p,mse2]=dct32th(img)
    f=1;
    for o=0:0.005:0.13
    D=[];
    M=[];
    for k=1:8
        C=[];
        L=[];
        for l=1:8
            A=img((k-1)*32+1:k*32,(l-1)*32+1:l*32);
            B=dct2D(A,32);
            th=B<o;
            B(th)=0;
            G=idct(idct(B,[],1),[],2);
            L=[L B];
            C=[C G];
        end
        D=[D; C];
        M=[M; L];
        if f==1
            d1=D;
        elseif f==26
            d2=D;
        end
    end
    z=0;
    for i=1:256
        for j=1:256
            if M(i,j)==0
                z=z+1;
            end
        end
    end
    z=100*(1-z/256/256);
    if (z<52)%&&(z>5)
        p(f)=z;
        mse2(f)=immse(img,D);
        f=f+1;
    end
end