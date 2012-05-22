function [img] = align1(img,template)
%align align1 aligns img to template and returns the result
%   align1 finds the normalized cross correlation
% (using the normxcor2 function) and finds the shifted position
% where correlation between the two images is the highest
% If an image is large decimation is performed to speed
% up calculations.

rows = size(template,1);

if rows > 1000
    %resize the images to make computationally easier
    img_sml = imresize(img,.25);
    template_sml = imresize(template,.25);

    img_xcor = normxcorr2(img_sml,template_sml);
    img_xcor = abs(img_xcor);
    [img_ypeak,img_xpeak] = find(img_xcor == max(img_xcor(:)));
    img_ypeak = img_ypeak - (size(img_sml,1)-1);
    img_xpeak = img_xpeak - (size(img_sml,2)-1);
    img_ypeak = img_ypeak*4;
    img_xpeak = img_xpeak*4;
else
    img_xcor = normxcorr2(img,template);
    img_xcor = abs(img_xcor);
    [img_ypeak,img_xpeak] = find(img_xcor == max(img_xcor(:)));
    img_ypeak = img_ypeak - (size(img,1)-1);
    img_xpeak = img_xpeak - (size(img,2)-1);
end

img = circshift(img,[img_ypeak img_xpeak]);

end
