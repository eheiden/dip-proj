%this script enhances cathedralRBG.tif

close all;

img= imread('cathedralRGB.tif');

%perform histogram equalization and scale back to 30%
img=color_histeq(img,.8);

%give scene more punch by increasing saturation (by 27%)
img=sat_adjust(img,.27);

% sharpen - watch for color noise
l = fspecial('log',30, .85);
img = img - imfilter(img, l,'replicate');

% save it
imwrite(img, 'cathedralRGBenhanced.tif');