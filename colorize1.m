close all;
clear all;

inputs = {'trainCar.jpg', 'river.jpg', 'tree.jpg', 'emir.tif', 'cathedral.tif'};
outputs = {'trainCarRGB.jpg', 'riverRGB.jpg', 'treeRGB.jpg', 'emirRGB.tif', 'cathedralRGB.tif'};

for i = 1:length(inputs)
    % read in the input image
    image = imread(inputs{i});
    %image = imread(input);
    
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
    prct = .08;
    B = crop_prct(B, prct);
    G = crop_prct(G, prct);
    R = crop_prct(R, prct);

    %align the green channel to blue:
    G = align1(G,B);
    %align the red channel to blue:
    R = align1(R,B);

    prct = .05;
    B = crop_prct(B, prct);
    G = crop_prct(G, prct);
    R = crop_prct(R, prct);
    
    % create the color image
    imageRGB = cat(3, R, G, B);
    imshow(imageRGB);

    % save it
    imwrite(imageRGB, outputs{i});
end
    
    