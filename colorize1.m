close all;
clear all;

inputs = {'trainCar.jpg', 'river.jpg', 'tree.jpg', 'emir.tif', 'cathedral.tif'};
outputs = {'trainCarRGB.jpg', 'riverRGB.jpg', 'treeRGB.jpg', 'emirRGB.tif', 'cathedralRGB.tif'};

%for i = 1:length(inputs)
    % read in the input image
    %image = imread(inputs{i});
    image = imread('river.jpg');
    
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
    B = crop_prct(B, prct);
    G = crop_prct(G, prct);
    R = crop_prct(R, prct);

    % Align the images
    % Functions that might be useful to you for aligning the images include:
    % "circshift", "sum", and "imresize" (for multiscale)
    %%%%%aG = align(G,B);
    %%%%%aR = align(R,B);
    aG = normxcorr2(B,G);
    aR = normxcorr2(B,R);
    
    absG = abs(aG);
    absR = abs(aR);
    
    [y1,x1] = find(absG == max(absG(:)));
    maxy = y1;
    maxx = x1;
    
    y1 = y1 - (size(B, 1) - 1)/2;
    x1 = x1 - (size(B, 2) - 1)/2;
    imshow(G);
    hold on
    plot(x1, y1, 'wo');
    
%    R = circshift(R, [11 3]);
 %   G = circshift(G, [5 2]);



    % create the color image
    %imageRGB = cat(3, R, G, B);
    %imshow(imageRGB);
    
    % save it
    %imwrite(imageRGB, outputs{i});
%end
    
    