% Load the test images, do the quantization and display the histograms and
% qunatized images.

clear all
close all
clc; 
% load demo images
image1_rgb = imread('blue.jpg');   
image2_rgb = imread('football.jpg');   
image3_rgb = imread('rainbow.jpg');   
image4_rgb = imread('sunset.jpg');   

% convert images to hsv color space
image1_hsv = rgb2hsv(image1_rgb);
image2_hsv = rgb2hsv(image2_rgb);
image3_hsv = rgb2hsv(image3_rgb);
image4_hsv = rgb2hsv(image4_rgb);

% the build in rgb2hsv function gives H values in the range[0,1]. Since
% they represent angles we will scale them to [0, 2*pi].
image1_hsv(:,:,1) = image1_hsv(:,:,1) * 2*pi;
image2_hsv(:,:,1) = image2_hsv(:,:,1) * 2*pi;
image3_hsv(:,:,1) = image3_hsv(:,:,1) * 2*pi;
image4_hsv(:,:,1) = image4_hsv(:,:,1) * 2*pi;

% Get the quantized image
image1_quant = ColorQuantizeHSV( image1_hsv );
image2_quant = ColorQuantizeHSV( image2_hsv );
image3_quant = ColorQuantizeHSV( image3_hsv );
image4_quant = ColorQuantizeHSV( image4_hsv );

% Plot the original image, the color histogram, and the quantized hsv
% image.
figure

subplot(3,4,1)
imshow(image1_rgb)
subplot(3,4,5)
plot_colorhist(image1_quant)
subplot(3,4,9)
plot_quantizedImage(image1_quant)

subplot(3,4,2)
imshow(image2_rgb)
subplot(3,4,6)
plot_colorhist(image2_quant)
subplot(3,4,10)
plot_quantizedImage(image2_quant)

subplot(3,4,3)
imshow(image3_rgb)
subplot(3,4,7)
plot_colorhist(image3_quant)
subplot(3,4,11)
plot_quantizedImage(image3_quant)

subplot(3,4,4)
imshow(image4_rgb)
subplot(3,4,8)
plot_colorhist(image4_quant)
subplot(3,4,12)
plot_quantizedImage(image4_quant)
 


