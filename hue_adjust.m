function im_out = hue_adjust(im, pct)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

if 0 < pct > 1
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

