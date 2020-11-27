function [imout]=medianf(x)

    imout = zeros(size(x),class(x));
    for m = 2 : size(x,1)-1
        for n = 2 : size(x,2)-1
            list = [x(m-1,n-1),x(m,n-1),x(m+1,n-1),x(m-1,n),x(m,n),x(m+1,n),x(m-1,n+1),x(m,n+1),x(m+1,n+1)];
            list1=sort(list);
            imout(m,n)=list1(5);
        end
    end
    
        for i=1:256
            for j=1:256 
                if (i==1)&&(j~=1)&&(j~=256)
                    imout(i,j)=imout(i+1,j);
                elseif (j==1)&&(i~=1)&&(i~=256)
                    imout(i,j)=imout(i,j+1);
                elseif (i==256)&&(j~=256)&&(j~=1)
                    imout(i,j)=imout(i-1,j);
                elseif (j==256)&&(i~=256)&&(i~=1)
                    imout(i,j)=imout(i,j-1);
                end
        end
    end
    imout(1,1)=(imout(1,2)+imout(2,1))/2;
    imout(1,256)=(imout(1,255)+imout(2,256))/2;
    imout(256,1)=(imout(256,2)+imout(255,1))/2;
    imout(256,256)=(imout(256,255)+imout(255,256))/2;
end