function img_noise = add_noise(img)
  [M,N]=size(img);
  for i=1:M
    for j=1:N
      A(i,j)=20*cos((pi*i)/3+(pi*j)/7) + 23*sin((pi*i)/3+(pi*j)/8);
    endfor
  endfor

  img_noise = img.+A;
