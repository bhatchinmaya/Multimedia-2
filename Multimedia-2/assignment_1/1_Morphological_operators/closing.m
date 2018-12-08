function [filteredImage] = closing(Image, mask)

dilate_data = dilate(Image,mask);

filteredImage =  erode(dilate_data,mask);



end
