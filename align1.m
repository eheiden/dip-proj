function [img] = align1(img,template)
%align FILL ME IN WITH WORDS
%   Detailed explanation goes here

rows = size(template,1);

if rows > 1000
    %resize the images to make computationally easier
    img_sml = imresize(img,.6);
    template_sml = imresize(template,.6);

    img_xcor = normxcorr2(img_sml,template_sml);
    img_xcor = abs(img_xcor);
    [img_ypeak,img_xpeak] = find(img_xcor == max(img_xcor(:)));
    img_ypeak = img_ypeak - (size(img_sml,1)-1);
    img_xpeak = img_xpeak - (size(img_sml,2)-1);
else
    img_xcor = normxcorr2(img,template);
    img_xcor = abs(img_xcor);
    [img_ypeak,img_xpeak] = find(img_xcor == max(img_xcor(:)));
    img_ypeak = img_ypeak - (size(img,1)-1);
    img_xpeak = img_xpeak - (size(img,2)-1);
end

img = circshift(img,[img_ypeak img_xpeak]);

end
