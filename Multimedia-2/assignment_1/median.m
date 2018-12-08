function [filteredImage] = median(Image, mask)

% convert data type of the mask to ensure that is is binary
mask = uint8(mask);


% determine size of the image and the mask
[height, width] = size(Image);
[mHeight, mWidth] = size(mask);

% check if size of mask even
if (mod(mHeight,2) == 0 || mod(mWidth,2) == 0)
   warning('invalid mask')
   return
end

%extend the input image depending on the mask size
extendedImage = padarray(Image, [(mHeight-1)/2, (mWidth-1)/2], 'replicate');

% initialize output (the filtered image) with zeros
filteredImage = zeros(height, width, 'uint8');

% iterate through the extended image
for h= %TODO: define iteration boundaries
    for w= %TODO: define iteration boundaries
        
        % extract local patch from the extended image
        patch = extendedImage(   ); % TODO
        
        % perform filtering on local patch an write the result in the
        % filteredImage
        
        % TODO
    end
end
    
end