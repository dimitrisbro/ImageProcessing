function [x]=minn(a,b,c)
    if (a<=b)&(a<=c)
        x=a;
    elseif (b<=c)&(b<=a)
        x=b;
    elseif (c<=a)&(c<=b)
        x=c;
    end
end
