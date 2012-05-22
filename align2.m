function [img] = align2(img, template, window)
%align2 aligns img to template using the sum of squared differences
%   Warning: Large images will take a long time to process.


[rows cols] = size(template);

img_i = img;

%initialize a blank ssd map
ssd_map = zeros(window,window);

if rows > 1000
    %resize the images to make computationally easier
    img_sml = imresize(img_i,.25);
    template_sml = imresize(template,.25);

    [rows cols] = size(template_sml);
    %dimensions for the template
    rows3rd = floor(rows/3);
    rows16th = floor(rows/16);
    cols3rd = floor(cols/3);
    cols16th = floor(cols/16);
    
    for i=1:window
        for j=1:window
            imgshift = circshift(img_i,[i-ceil(window/2) j-ceil(window/2)]);
            template_chop = template_sml(rows16th:rows3rd,cols16th:cols3rd);
            img_chop = imgshift(rows16th:rows3rd,cols16th:cols3rd);
            ssd_map(i,j) = sum(((template_chop(:)-img_chop(:)).^2));
        end
    end
    
    [ssd_ypeak,ssd_xpeak] = find(ssd_map == min(ssd_map(:)));
    ssd_ypeak = floor(ssd_ypeak-window/2)*4;
    ssd_xpeak = floor(ssd_xpeak-window/2)*4;

else
    %dimensions for the template
    rows3rd = floor(rows/3);
    rows16th = floor(rows/16);
    cols3rd = floor(cols/3);
    cols16th = floor(cols/16);
    
    %create a SSD map of size window
    for i=1:window
        for j=1:window
            imgshift = circshift(img_i,[i-ceil(window/2) j-ceil(window/2)]);
            template_chop = template(rows16th:rows3rd,cols16th:cols3rd);
            img_chop = imgshift(rows16th:rows3rd,cols16th:cols3rd);
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

