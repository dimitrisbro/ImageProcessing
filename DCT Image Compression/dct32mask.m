function [D,mse1]=dct32mask(img)
    f=1;
    %mse1=0;
    m1=zeros(32,32);
    %m2=zeros(32,32);
    for n=10:32
        o=0;
        for r=1:n
            for h=1:n-o
                %if n==3
                    m1(r,h)=1;
                %elseif n==32
                    %m2(r,h)=1;
                %end
            end
            o=o+1;
        end
    
    
    D=[];
    %S=[];
    for k=1:8
        C=[];
        %R=[];
        for l=1:8
            A=img((k-1)*32+1:k*32,(l-1)*32+1:l*32);
            B=dct2D(A,32);
            %Q=B.*m2;
            G=B.*m1;
            G=idct(idct(G,[],1),[],2);
            %Q=idct(idct(Q,[],1),[],2);
            C=[C G];
            %R=[R Q];
        end
        D=[D; C];
        %S=[S; R];
    end
    mse1(f)=immse(uint8(D),uint8(img));
    f=f+1;
    end
end