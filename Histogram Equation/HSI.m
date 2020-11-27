function [A]=HSI(im)
    for i=1:256
        for j=1:256
            R=im(i,j,1);
            G=im(i,j,2);
            B=im(i,j,3);
            c=double(((R-G)+(R-B))/2);
            b=sqrt(double(((R-G)^2)+(R-B)*(G-B)));
            th=cos(c / b)^(-1);
            if B<=G
                H=th;
            else
                H=360-th;
            end
            x=minn(R,G,B);
            S=1-3*x/(R+G+B);
            I=(R+G+B)/3;
            A(i,j,1)=H;
            A(i,j,2)=S;
            A(i,j,3)=I;
        end
    end
end