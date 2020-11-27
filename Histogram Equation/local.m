function [Img]=local(im)
    Img=im;
    %WINDOW SIZE
    M=5;
    N=5;
    mid_val=round((M*N)/2);

    %eyreshgrammwn kai sthlwn poy prepei na kanw zero-padding
    in=0;
    for i=1:M
        for j=1:N
            in=in+1;
            if(in==mid_val)
                PadM=i-1;%PadM=2 gia maska 5x5
                PadN=j-1;%PadN=2
                break;
            end
        end
    end

    %zero padding gyrw gyrw apo thn eikona
    B=padarray(im,[PadM,PadN]);
    for i= 1:size(B,1)-((PadM*2)+1)%1:255
        for j=1:size(B,2)-((PadN*2)+1)%1:255
            cdf=zeros(256,1);
            inc=1;
            for x=1:M
                for y=1:N 
                    if(inc==mid_val)
                        ele=B(i+x-1,j+y-1)+1;
                    end
                    pos=B(i+x-1,j+y-1)+1;
                    cdf(pos)=cdf(pos)+1;
                    inc=inc+1;
                end
            end
            for l=2:256
                cdf(l)=cdf(l)+cdf(l-1);
            end
            Img(i,j)=round(cdf(ele)/(M*N)*255);
        end
    end
end