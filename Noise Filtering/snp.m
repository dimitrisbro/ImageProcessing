function [imsp,posze,poson,x]=snp(im,p)

    imsp=im;
    x = rand(size(imsp));
    th = find(x < p/2);
    imsp(th) = 0;
    th = find(x >= p/2 & x < p);
    imsp(th) = 1;
    
    ze=0;on=0;
    for i=1:256
        for j=1:256
            if imsp(i,j)==0
                ze=ze+1;
            elseif imsp(i,j)==1
                on=on+1;
            end
        end
    end
    posze=256*256/ze;
    poson=256*256/on;
end