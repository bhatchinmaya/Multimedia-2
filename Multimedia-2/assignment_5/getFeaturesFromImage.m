% Extracts the features for the given filter from the given image.
function [features] = getFeaturesFromImage(image, filter, blocksize)

% Get image size and number of blocks in the image
imsize = size(image);
imsizeBlocks = imsize ./ blocksize;
nrBlocks = imsizeBlocks(1) * imsizeBlocks(2);
features = zeros( 1, nrBlocks );

% Filter the image with the given filter
filterresponse = filter2(filter,image);

% Iterate over blocks
for block_y = 1:imsizeBlocks(1)
   for block_x = 1:imsizeBlocks(2)
       % Extrace feature value for every block
       index_crop = [(block_y-1)*blocksize+1:block_y*blocksize; (block_x-1)*blocksize+1:block_x*blocksize];
       mean_filter = mean(mean(abs(filterresponse(index_crop(1,:),index_crop(2,:)))));
       features((block_y-1)*imsizeBlocks(2) + block_x) = mean_filter;
   end
end