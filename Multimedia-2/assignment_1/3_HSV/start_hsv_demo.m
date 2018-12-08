% Load the test images and convert them to the hsv color space using RGB2HSV.m
% Convert them back to RGB and display the results.

clear all
close all

% load test images
image1_rgb = double( imread('blue.jpg')) / 255;
image2_rgb = double( imread('football.jpg')) / 255;
image3_rgb = double( imread('rainbow.jpg')) / 255;
image4_rgb = double( imread('sunset.jpg')) / 255;

% convert to HSV color space
image1_hsv = RGB2HSV(image1_rgb);
image2_hsv = RGB2HSV(image2_rgb);
image3_hsv = RGB2HSV(image3_rgb);
image4_hsv = RGB2HSV(image4_rgb);

% We define the hue component in the range [0,2*pi].
% The reconstruction function expects hue to be in [0,1].
image1_hsv(:,:,1) = image1_hsv(:,:,1) / (2.0*pi);
image2_hsv(:,:,1) = image2_hsv(:,:,1) / (2.0*pi);
image3_hsv(:,:,1) = image3_hsv(:,:,1) / (2.0*pi);
image4_hsv(:,:,1) = image4_hsv(:,:,1) / (2.0*pi);

% convert back to RGB
image1_rgb_rec = hsv2rgb(image1_hsv);
image2_rgb_rec = hsv2rgb(image2_hsv);
image3_rgb_rec = hsv2rgb(image3_hsv);
image4_rgb_rec = hsv2rgb(image4_hsv);

% Plot the original and the reconstructed images.
figure

subplot(2,4,1)
imshow(image1_rgb)
subplot(2,4,5)
imshow(image1_rgb_rec)

subplot(2,4,2)
imshow(image2_rgb)
subplot(2,4,6)
imshow(image2_rgb_rec)

subplot(2,4,3)
imshow(image3_rgb)
subplot(2,4,7)
imshow(image3_rgb_rec)

subplot(2,4,4)
imshow(image4_rgb)
subplot(2,4,8)
imshow(image4_rgb_rec)
