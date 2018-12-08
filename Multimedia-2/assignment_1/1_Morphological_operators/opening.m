function [filteredImage] = opening(Image, mask)

 
erode_data = erode(Image, mask);
filteredImage = dilate(erode_data,mask); 



end