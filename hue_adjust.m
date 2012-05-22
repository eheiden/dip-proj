function im_out = hue_adjust(im, pct)
%hue_adjust shifts the hue of image im by pct (0 < pct < 1)
%   hue_adjust shifts the hue of the input image im from 
% between 0 and 1.  1 represents a 360 shift (no change), 
% and 0 represents no shift (no change).  Any value between
% 0 and 1 will result in a change of hue in the output image.
% image is output in RGB format

if 0 > pct > 1
    error('color_histeq percentage weight must be between 0 and 1.')
end

% convert to HSV
imHSV = rgb2hsv(im);

% shift the hue
hue = imHSV(:, :, 1);
hue = hue + pct;

% wrap hue back around
hue(hue > 1) = hue(hue > 1) - 1;
imHSV(:, :, 1) = hue;

% convert the image back to RGB
im_out = hsv2rgb(imHSV);
end

