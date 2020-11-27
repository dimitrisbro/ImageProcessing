function [aa,b]=sobel(img)
    mask1 = [-1 0 1 ; -2 0 2; -1 0 1];
    mask2 = [-1 -2 -1; 0 0 0; 1 2 1];
    mask3 = [0 1 2; -1 0 1; -2 -1 0];
    mask4 = [-2 -1 0; -1 0 1; 0 1 2];

    y = conv2(img, mask1, 'same');
    x = conv2(img, mask2, 'same');    
    z = conv2(img, mask3, 'same');
    w = conv2(img, mask4, 'same');
    
    a=zeros(480,704);
    l=0;
    s=0;
    for i=1:480
        for j=1:704
            if (x(i,j)>=y(i,j))&&(x(i,j)>=z(i,j))&&(x(i,j)>=w(i,j))&&(x(i,j)>25)
                a(i,j)=x(i,j);
                s=s+a(i,j);
                l=l+1;
            elseif (y(i,j)>=x(i,j))&&(y(i,j)>=z(i,j))&&(y(i,j)>=w(i,j))&&(y(i,j)>25)
                a(i,j)=y(i,j);
                s=s+a(i,j);
                l=l+1;
            elseif (z(i,j)>=x(i,j))&&(z(i,j)>=y(i,j))&&(z(i,j)>=w(i,j))&&(z(i,j)>25)
                a(i,j)=z(i,j);
                s=s+a(i,j);
                l=l+1;
            elseif (w(i,j)>=x(i,j))&&(w(i,j)>=y(i,j))&&(w(i,j)>=z(i,j))&&(w(i,j)>25)
                a(i,j)=w(i,j);
                s=s+a(i,j);
                l=l+1;
            else
                a(i,j)=0;
            end
        end
    end
    max1=max(max(a));
    min1=min(min(a));
    aa = 255/double((max1-min1))*(a-min1);
    b=aa;
    th = b < 50;
    b(th) = 0;

end