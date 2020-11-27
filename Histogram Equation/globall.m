function [nim]=globall(im)
    for j=1:3
        k=im(:,:,j);
        nim(:,:,j)= hist_eqG(k);
end
 