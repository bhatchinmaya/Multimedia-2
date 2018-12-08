%% MMC 2018

clc; close all; clear all;

image_input = double(imread('coins.png'));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 3.1 - sobel
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% first use edge analysis based on sobel gradient filtering
sobelImage_v = gradientAnalysis(image_input, 'v');
sobelImage_h = gradientAnalysis(image_input, 'h');
sobelImage_dplus = gradientAnalysis(image_input, 'd+');
sobelImage_dminus = gradientAnalysis(image_input, 'd-');

figure(2)
subplot(2,2,1)
imshow(sobelImage_v,[min(sobelImage_v(:)), max(sobelImage_v(:))])
title('Sobel vertical')
subplot(2,2,2)
imshow(sobelImage_h,[min(sobelImage_h(:)), max(sobelImage_h(:))])
title('Sobel horizontal')
subplot(2,2,3)
imshow(sobelImage_dplus,[min(sobelImage_dplus(:)), max(sobelImage_dplus(:))])
title('Sobel diagonal +')
subplot(2,2,4)
imshow(sobelImage_dminus,[min(sobelImage_dminus(:)), max(sobelImage_dminus(:))])
title('Sobel diagonal -')



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 3.2 - laplace
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% edge analysis based on laplacian filtering
laplaceImage_1 = laplaceAnalysis(image_input, '1');
laplaceImage_2 = laplaceAnalysis(image_input, '2');
laplaceImage_2sep = laplaceAnalysis(image_input, '2sep');


figure
subplot(2,2,1)
imshow(laplaceImage_1,[min(laplaceImage_1(:)), max(laplaceImage_1(:))])
title('Laplace Filtering (1)')
subplot(2,2,2)
imshow(laplaceImage_2,[min(laplaceImage_2(:)), max(laplaceImage_2(:))])
title('Laplace Filtering (2)')
subplot(2,2,3)
imshow(laplaceImage_2sep,[min(laplaceImage_2sep(:)), max(laplaceImage_2sep(:))])
title('Laplace Filtering (2 Separable)')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 3.2 - edge tracking
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
edge_image = [  9 0 5 0 8 0 4 5 0 3;    
                0 5 0 0 0 6 0 4 2 0;
                0 0 9 0 1 5 0 0 5 0;
                6 0 0 4 0 0 7 0 2 0;
                0 3 0 6 2 0 9 0 0 7;
                4 0 6 0 0 4 0 3 0 5;
                0 0 5 0 2 4 0 0 7 0;
                6 4 0 3 0 4 0 0 4 2; ];
            
tracked_img = edge_tracking(edge_image,7,3);

