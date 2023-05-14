function zero_matrix = zhurma(img, shperndarja, x, y, z, k, s, a, b)
  % shperndarja: emri i shperndarjes (Rayleigh, Eksponenciale, LogNormal, Salt&Pepper, ose Erlang)
  % x: rreshti fillues i zhurmës
  % y: shtylla fillestare e zhurmës
  % z: rreshti fundit i zhurmës
  % k: shtylla fundit e zhurmës
  % s: numri i shtresave (1, 2, ose 3)
  % a: parameteri i parë i shpërndarjes
  % b: parameteri i dytë i shpërndarjes (nuk është i nevojshëm për shpërndarjet Salt&Pepper dhe Erlang)

  % Krijimi i matricës së zhurmës me zero vlera
  %noisy_img = zeros(img);


  % Vlerat e zhurmës gjenerohen për çdo pikë të matricës së zhurmës, sipas shpërndarjes të caktuar
  for i = 1:s
    switch shperndarja
      case 'Rayleigh'
        zero_matrix = a+sqrt(-b*log(1-rand(z,k)));
        noisy_img = img+zero_matrix;
        imwrite(noisy_img,"noise_rayleigh.tif");
        imshow(img),figure,imshow(img+zero_matrix);
      case 'Eksponenciale'
        zero_matrix = -log(1-rand(z,k))/a;
        noisy_img = img+zero_matrix;
        imwrite(noisy_img,"noise_exponential.tif");
        imshow(img),figure,imshow(img+zero_matrix);
      case 'LogNormal'
        zero_matrix = a*exp(b*randn(z,k));
        noisy_img = img+zero_matrix;
        imwrite(noisy_img,"noise_lognormal.tif");
        imshow(img),figure,imshow(img+zero_matrix);
      case 'Salt&Pepper'
        for j = 1:k-y
          for m = 1:z-x
            zero_matrix = a + (b-a)*rand(z,k);
            salt_pepper = rand;
            if salt_pepper <= a
              noisy_img(m,j,i) = 0;
            elseif salt_pepper >= b
              noisy_img(m,j,i) = 255;
            else
              noisy_img(m,j,i)=img(m,j,i);
            endif
          endfor
        endfor
        imwrite(noisy_img,"noise_saltpepper.tif");
        imshow(img),figure,imshow(noisy_img);
        zero_matrix=noisy_img;
        case 'Erlang'
          zero_matrix = -log(1-rand(z,k))/a;
          for h=2:b
            zero_matrix = zero_matrix-log(1-rand(z,k))/a;
          endfor
          noisy_img = img+zero_matrix;
        imwrite(noisy_img,"noise_erlang.tif");
          imshow(img),figure,imshow(img+zero_matrix);
          endswitch
      endfor

