function [imout]=meanf(x)

    imout = zeros(480,704,3);
    for k=1:3
        for m = 2 : 480-1
            for n = 2 : 704-1
                list = [x(m-1,n-1,k),x(m,n-1,k),x(m+1,n-1,k),x(m-1,n,k),x(m,n,k),x(m+1,n,k),x(m-1,n+1,k),x(m,n+1,k),x(m+1,n+1,k)];
                s=sum(list)/9;
                imout(m,n,k)=s;
            end
        end

        for i=1:480
            for j=1:704 
                if (i==1)&&(j~=1)&&(j~=704)
                    imout(i,j,k)=imout(i+1,j,k);
                elseif (j==1)&&(i~=1)&&(i~=480)
                    imout(i,j,k)=imout(i,j+1,k);
                elseif (i==480)&&(j~=704)&&(j~=1)
                    imout(i,j,k)=imout(i-1,j,k);
                elseif (j==704)&&(i~=480)&&(i~=1)
                    imout(i,j,k)=imout(i,j-1,k);
                end
            end
        end
        imout(1,1,k)=(imout(1,2,k)+imout(2,1,k))/2;
        imout(1,704,k)=(imout(1,703,k)+imout(2,704,k))/2;
        imout(480,1,k)=(imout(480,2,k)+imout(479,1,k))/2;
        imout(480,704,k)=(imout(480,703,k)+imout(479,704,k))/2;
    end
end
            