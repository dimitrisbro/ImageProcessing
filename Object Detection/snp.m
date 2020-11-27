function [imsp]=snp(im,p)

    imsp=im;
    x = rand(size(imsp));
    th = find(x < p/2);
    imsp(th) = 0;
    th = find(x >= p/2 & x < p);
    imsp(th) = 255;
    
    ze=0;on=0;
    for i=1:480
        for j=1:704
            if imsp(i,j)==0
                ze=ze+1;
            elseif imsp(i,j)==255
                on=on+1;
            end
        end
    end
end