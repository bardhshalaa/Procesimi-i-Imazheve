function F = line_filter(img, direction, start)
  [M,N]=size(img);
  switch direction
    case 'h'
      for i=1:M
        for j=1:N
          if(i==start)
            A(i,j)=0;
          else
            A(i,j)=1;
            endif
        endfor
      endfor
    case 'v'
      for i=1:M
        for j=1:N
          if(j==start)
            A(i,j)=0;
          else
            A(i,j)=1;
            endif
        endfor
      endfor
  endswitch
  F=A;

