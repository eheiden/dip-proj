function [img] = align2(img, template, window, crop_box)
%align2 aligns img to template using the sum of squared differences
%   align2 aligns img to template using the sum of squared
% differences.  window is the number of pixels to shift the
% image in each direction to find alignment (note: for images
% over 1000 pixels in height, window actually is increased to
% window*5 as errors tend to be larger in larger images).
% The 'crop_box' option is a special option for the emir.tif
% file to enable a different subsection of the image to align
% due to color channel difference difficulties.

[rows cols] = size(template);

img_i = img;

%initialize a blank ssd map
ssd_map = zeros(window,window);

if rows > 1000
    
    window = window*5;
    %resize the images to make computationally easier
    img_sml = imresize(img_i,.25);
    template_sml = imresize(template,.25);

    [rows cols] = size(template_sml);
    if crop_box == 1
        %dimensions for the template
        rowspt1 = floor(rows/2);
        rowspt2 = floor((rows*4)/5);
        colspt1 = floor((cols*3)/4);
        colspt2 = floor((cols-10));
    else
        rowspt1 = floor(rows/3);
        rowspt2 = floor((rows*2)/3);
        colspt1 = floor(cols/3);
        colspt2 = floor((cols*2)/3);
    end

    for i=1:window
        for j=1:window
            imgshift = circshift(img_sml,[i-ceil(window/2) j-ceil(window/2)]);
            template_chop = template_sml(rowspt1:rowspt2,colspt1:colspt2);
            img_chop = imgshift(rowspt1:rowspt2,colspt1:colspt2);
%             subplot(1,2,1);imshow(template_chop);
%             subplot(1,2,2);imshow(img_chop);
            ssd_map(i,j) = sum(((template_chop(:)-img_chop(:)).^2));
        end
    end
    
    [ssd_ypeak,ssd_xpeak] = find(ssd_map == min(ssd_map(:)));
    ssd_ypeak = floor(ssd_ypeak-window/2)*4;
    ssd_xpeak = floor(ssd_xpeak-window/2)*4;

else
    %dimensions for the template
    rowspt1 = floor(rows/3);
    rowspt2 = floor((rows*2)/3);
    colspt1 = floor(cols/3);
    colspt2 = floor((cols*2)/3);
    
    %create a SSD map of size window
    for i=1:window
        for j=1:window
            imgshift = circshift(img_i,[i-ceil(window/2) j-ceil(window/2)]);
            template_chop = template(rowspt1:rowspt2,colspt1:colspt2);
            img_chop = imgshift(rowspt1:rowspt2,colspt1:colspt2);
            ssd_map(i,j) = sum(((template_chop(:)-img_chop(:)).^2));
        end
    end
    
    %find lowest ssd in window and determine the shift based on that
    [ssd_ypeak,ssd_xpeak] = find(ssd_map == min(ssd_map(:)));
    ssd_ypeak = floor(ssd_ypeak-window/2);
    ssd_xpeak = floor(ssd_xpeak-window/2);
end

img = circshift(img,[ssd_ypeak ssd_xpeak]);
end

