function im_out = sat_adjust(im, pct)
%color_histeq performs histogram equalization on a color image.
%   Histogram equalization of a colored image achieved by
% performing the equalization on the V (value) channel of the
% HSV color space.  Returns an RGB image.

if 0 < pct > 1
    error('color_histeq percentage weight must be between 0 and 1.')
end

% convert to HSV
imHSV = rgb2hsv(im);

% apply histogram equalization to the V component
imHSV(:,:,2) = (1+pct) .* imHSV(:, :, 2);

imHSV(imHSV > 1) = 1;  % Limit values

% convert the image back to RGB
im_out = hsv2rgb(imHSV);
end