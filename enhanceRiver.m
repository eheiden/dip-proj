close all;

img= imread('riverRGB.jpg');

%perform histogram equalization and scale back to 30%
img=color_histeq(img,.3);
%increase saturation by 20%
img=sat_adjust(img,.2);
%shift hue away from sickly cyan
img=hue_adjust(img,.043);

% sharpen
l = fspecial('log',40, .76);
img = img - imfilter(img, l,'replicate');

% save it
imwrite(img, 'riverRGBenhanced.jpg');