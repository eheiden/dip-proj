clear all;
clear figures;

%inputs = {'trainCar.jpg', 'river.jpg', 'tree.jpg', 'emir.tif', 'cathedral.tif'};
%outputs = {'trainCarRGB.jpg', 'riverRGB.jpg', 'treeRGB.jpg', 'emirRGB.tif', 'cathedralRGB.tif'};

%for i = 1:length(inputs)
    % read in the input image
    %image = imread(inputs{i});
    image = imread('emir.tif');
    
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
    
%     %percentage of the image to check for black/white borders
%     prct = .09;
%     u_thresh = .85;
%     l_thresh = .06;
%     %number of rows/cols to average for this image size
%     [row,col] = size(B);
%     len = floor(max(row,col)*prct);
%     top = 1:len;
%     bot = row:-1:(row-len);
%     left = top;
%     right = bot;
%     
%     B_top = mean(B(top,:),2);
%     B_bot = mean(B(bot,:),2);
%     B_left = mean(B(:,left),1);
%     B_right = mean(B(:,right),1);
%     
%     %where to crop the image
%     if max(B_top) > u_thresh
%         for i = len:-1:1;
%            if B_top(i) < u_thresh
%               cut_blk = i-1;
%               break;
%            end
%         end
%     end   
%     
%     min_btop = min(B_top)
%     
%     if min(B_top) < l_thresh
%         for i = len:-1:1;
%             if B_top(i) > l_thresh
%                 cut_wht = i-1;
%                 break;
%             end
%         end
%     end
%     B_crop = B((max(cut_blk,cut_wht):end),:); 
%     B_cropped_less = B((max(cut_blk,cut_wht)-10:end),:); 
%     figure,imshow(B_crop);
%     figure,imshow(B_cropped_less); title('cropped 10 pixels less');
    %figure,imshow(B);
    
    % Align the images
    % Functions that might be useful to you for aligning the images include:
    % "circshift", "sum", and "imresize" (for multiscale)
    %%%%%aG = align(G,B);
    %%%%%aR = align(R,B);

    % create the color image
    imageRGB = cat(3, R, G, B);
    
    imshow(imageRGB);
    % save it
    %imwrite(imageRGB, outputs{i});
%end
    
    