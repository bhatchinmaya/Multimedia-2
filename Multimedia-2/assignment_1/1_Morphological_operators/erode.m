function [filteredImage] = erode(Image, mask)


%Image = 255 - Image;

% convert data type of the mask to ensure that is is binary
mask = uint8(mask);


% determine size of the image and the mask
[iRows, iColumns, iHeight] = size(Image);
[mRows, mColumns] = size(mask);

% check if size of mask even
if (mod(mRows,2) == 0 || mod(mColumns,2) == 0)
   warning('invalid mask')
   return
end

%extend the input image depending on the mask size
extendedImage = padarray(Image, [(mRows-1)/2, (mColumns-1)/2], 'replicate');
[eRows, eColumns, eHeight] = size(extendedImage) ;

% initialize filteredImage with zeros
filteredImage = zeros(iRows, iColumns, 'uint8');



% iterate through the extended image
for height = 1:iHeight
  for rows= 1:eRows-(mRows-1)
      for columns= 1:eColumns-(mColumns-1)
        select =   extendedImage(rows:(rows+mRows-1),columns:(columns+mColumns-1), height).*mask;
        % for mediun filter 
        %filteredImage(rows-1+(mRows-1)/2, columns-1+(mColumns-1)/2, height) = median(select(:)); 
        % for dilation    
        %filteredImage(rows-1+(mRows-1)/2, columns-1+(mColumns-1)/2, height) = max(select(:));
        % for erosion 
         filteredImage(rows-1+(mRows-1)/2, columns-1+(mColumns-1)/2, height) = min(select(:));
      end
  end
end 

%image(~filteredImage);

%filteredImage = 255 - filteredImage; 

end