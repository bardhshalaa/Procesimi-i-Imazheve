
function filtered_img = apply_gaussian_filter(img, filter_size, sigma)
% img: imazhi origjinal
% filter_size: madhësia e filterit
% sigma: devijimi standard i shpërndarjes normale

% Krijimi i filterit
[x,y] = meshgrid(-floor(filter_size/2):floor(filter_size/2));
gaussian_filter = exp(-(x.^2+y.^2)/(2*sigma^2));
gaussian_filter = gaussian_filter / sum(gaussian_filter(:));

% Krijimi i imazhit të ri me vlera 0
filtered_img = zeros(size(img));

% Aplikimi i filterit në imazhin origjinal dhe ruajtja ne imazh të ri
for i = ceil(filter_size/2):size(img,1)-floor(filter_size/2)
    for j = ceil(filter_size/2):size(img,2)-floor(filter_size/2)
        img_patch = img(i-floor(filter_size/2):i+floor(filter_size/2), j-floor(filter_size/2):j+floor(filter_size/2));
        filtered_img(i,j) = sum(img_patch(:) .* gaussian_filter(:));
    end
end

% Ruajtja e imazhit në formatin korrekt
filtered_img=uint8(filtered_img);

%Shfaqja e imazheve
imshow(img),figure,imshow(filtered_img);

