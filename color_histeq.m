function im_out = color_histeq(im, pct)
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
hsv_component = pct .* histeq(imHSV(:, :, 3));
reg_component = (1-pct) .* imHSV(:,:,3);
imHSV(:,:,3) = (hsv_component + reg_component);

% convert the image back to RGB
im_out = hsv2rgb(imHSV);
end

