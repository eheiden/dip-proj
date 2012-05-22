close all;

img= imread('treeRGB.jpg');

%perform histogram equalization and scale back to 40%
img=color_histeq(img,.5);

%increase saturation by 37%
img=sat_adjust(img,.37);

% sharpen fairly intensely to add texture to the leaves
l = fspecial('log',40, .76);
img = img - imfilter(img, l,'replicate');

% save it
imwrite(img, 'treeRGBenhanced.jpg');