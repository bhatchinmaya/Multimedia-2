clc; clear all; close all;


% read input image and convert it to gray scale
% NOTE: The background color in the original image is white. Because all
% algorithms assumes black as background color we perform an inversion
% of the colors
image1 = 255 - imread('Image1.jpg');
image2 = 255 - imread('Image2.jpg');
if (size(image1,2) > 1)
    image1 = rgb2gray(image1);
end
if(size(image2,2) >1)
    image2 = rgb2gray(image2);
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Exercise 1.4  - inner contour image 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% compute the inner contour 
mask = ones(3);
erosion = erode(image1, mask);
innerContour = image1 - erosion; 
figure(1);
imshow(~innerContour);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Exercise 1.5  - remove the stripes 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% define a desired mask
mask = ones(3);
% filter the image
filteredImg = %TODO

% show the filtered image
figure;
imshow(~filteredImg);

% define a new mask to remove the noise
mask = %TODO

% filter the image to remove the noise
filteredImg = %TODO

% show the filtered image
figure;
imshow(~filteredImg);

