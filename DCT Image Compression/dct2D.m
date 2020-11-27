function [DCT2]=dct2D(img,N)
    F1=zeros(N);
    DCT2=zeros(N);
    for i=1:N
        row=img(i,:);
        F1(i,:)=dct1D(row);
    end
    for j=1:N
        columns=F1(:,j);
        DCT2(:,j)=dct1D(columns);
    end

end