%this script enhances trainCar.jpg
close all;

img= imread('trainCarRGB.jpg');

%perform histogram equalization and scale back to 40%
img=color_histeq(img,.4);

%increase saturation by 37%
img=sat_adjust(img,.37);

figure; imshow(img);

% subtly sharpen the image without adding noticable noise
l = fspecial('log',40, 1);
img = img - imfilter(img, l,'replicate');
figure;imshow(img);

% save it
imwrite(img, 'trainCarRGBenhanced.jpg');