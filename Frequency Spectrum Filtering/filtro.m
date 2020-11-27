function [H]=filtro()
    [a,b] = freqspace(256,'meshgrid');
    d = zeros(256,256);
    for i = 1:256
        for j = 1:256
            d(i,j) = sqrt(a(i,j).^2 + b(i,j).^2);
        end
    end
    threshold = 0.5;
    H = zeros(256,256);
    for i = 1:256
        for j = 1:256
            if abs(d(i,j)) <= threshold
                H(i,j) = 1;
            else
                H(i,j) = 0;
            end
        end
    end
end