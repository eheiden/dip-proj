function [img] = align1(img,template)
%align FILL ME IN WITH WORDS
%   Detailed explanation goes here

img_xcor = normxcorr2(img,template);
img_xcor = abs(img_xcor);
[img_ypeak,img_xpeak] = find(img_xcor == max(img_xcor(:)));
img_ypeak = img_ypeak - (size(img,1)-1);
img_xpeak = img_xpeak - (size(img,2)-1);
img = circshift(img,[img_ypeak img_xpeak]);

end
