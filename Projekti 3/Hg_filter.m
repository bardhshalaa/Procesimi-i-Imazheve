function  Hg = Hg_filter(img_size, u0, v0)
    % Llogaritja e madhesise se filterit
    [M, N] = size(img_size);

    for i=1:M
      for j=1:N
        D0=(sqrt(pow2(i-M/2+u0)+pow2(j-N/2+v0)));
        D1=(sqrt(pow2(i-M/2-u0)+pow2(j-N/2-v0)));
        D2=(sqrt(pow2(i-M/2+u0)+pow2(j-N/2+v0)));
        A(i,j)=1-exp(-(1/2)*(D1*D2)/D0);
      endfor
    endfor

    Hg=A;
end
