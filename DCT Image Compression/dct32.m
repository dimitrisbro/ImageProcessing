function [D]=dct32(img)    
    D=[];
    for k=1:8
        C=[];
        for l=1:8
            A=img((k-1)*32+1:k*32,(l-1)*32+1:l*32);
            B=dct2D(A,32);
            C=[C B];
        end
        D=[D; C];
    end
end
