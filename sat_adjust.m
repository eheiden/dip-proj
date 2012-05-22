function im_out = sat_adjust(im, pct)
%sat_adjust increases the saturation of an image by pct.
%   sat_adjust uses the HSV color space to increase the
% saturation of an image by pct.  For example, if the function
% was called as: sat_adjust(img,.25), then the returned image's
% saturation would be 25% closer to total saturation. (note: 
% saturation levels exceeding 1 are clipped to 1). Returns 
% an RGB image.

if 0 > pct > 1
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