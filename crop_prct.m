function img_out = crop_prct(img_in, percent)
%crop_prct crops a percent of each edge of an image and returns it.
%   percent must be between 0 and 1.  For example: .05 = 5%.
%   In the above example 5% of the image would be cropped from 
%   all sides of the image.

[row,col] = size(img_in);
len = floor(max(row,col)*percent);
img_out = img_in(len:(end-len),len:(end-len));
end

