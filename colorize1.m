close all;
clear all;

inputs = {'trainCar.jpg', 'river.jpg', 'tree.jpg', 'emir.tif', 'cathedral.tif'};
outputs = {'trainCarRGB.jpg', 'riverRGB.jpg', 'treeRGB.jpg', 'emirRGB.tif', 'cathedralRGB.tif'};

for i = 1:length(inputs)
    % read in the input image
    image = imread(inputs{i});
    %image = imread('trainCar.jpg');
    
    % you may want to crop out the black borders first
    
    % compute the height of each part (just 1/3 of total)
    height = floor(size(image,1)/3);
    
    % separate color channels
    B = image(1:height,:);
    G = image(height+1:height*2,:);
    R = image(height*2+1:height*3,:);

    % you may want to convert the color planes to double
    % or do other preprocessing
    B = im2double(B);
    G = im2double(G);
    R = im2double(R);
    
    %percentage of the image to check for black/white borders
    prct = .07;
    B_crop = crop_prct(B, prct);
    G_crop = crop_prct(G, prct);
    R_crop = crop_prct(R, prct);
    
    figure;
    subplot(1,3,1); imshow(B_crop);
    subplot(1,3,2); imshow(G_crop);
    subplot(1,3,3); imshow(R_crop);
    % Align the images
    % Functions that might be useful to you for aligning the images include:
    % "circshift", "sum", and "imresize" (for multiscale)
    %%%%%aG = align(G,B);
    %%%%%aR = align(R,B);

    % create the color image
    %imageRGB = cat(3, R, G, B);
    
    %imshow(imageRGB);
    % save it
    %imwrite(imageRGB, outputs{i});
end
    
    