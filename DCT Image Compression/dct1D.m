function dct = dct1D (x)
    N = length(x);
    y = zeros(N, 1);
    for n = 1: (N/2)
        y(n) = x((2*n)-1);
        y(N-n+1) = x(2*n);
    end
    F = fft(y);
    dct = zeros(1, N);
    for k = 1:N
        dct(k) = real(w(k-1,N)* exp(-1i*pi*(k-1)/(2*N))*(F(k)));
    end
end

