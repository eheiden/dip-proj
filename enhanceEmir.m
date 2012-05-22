close all;

img= imread('emirRGB.tif');

%perform histogram equalization and scale back to 30%
img=color_histeq(img,.5);

%subtly increase saturation (by 15%)
img=sat_adjust(img,.15);

% sharpen
l = fspecial('laplacian',.5);
%l = fspecial('log',40, .76);
img = img - imfilter(img, l,'replicate');

% save it
imwrite(img, 'emirRGBenhanced.tif');