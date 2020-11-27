function [p]=maskp()
    m=zeros(32,32);
    for l=1:64
        k=0;
        for i=1:l
            for j=1:l-k
                m(i,j)=1;
            end
            k=k+1;
        end
        if l>32
            m=m(1:32,1:32);
        end
        on=sum(sum(m));
        p(l)=on/32/32; 
    end 
end