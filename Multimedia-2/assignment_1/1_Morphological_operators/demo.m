% Some examples
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% morphological operators
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
scrnsz  = get(0,'ScreenSize');

binary_image=uint8(255*[[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
                        [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
                        [0 0 0 0 0 1 1 1 1 1 1 0 0 0 0];
                        [0 0 0 0 1 1 1 1 1 1 1 1 1 0 0];
                        [0 0 0 1 1 1 1 1 1 1 1 1 0 0 0];
                        [0 0 1 1 1 1 1 1 1 1 0 0 0 0 0];
                        [0 0 1 1 0 1 1 1 1 1 1 0 0 0 0];
                        [0 0 0 0 0 0 0 1 0 0 0 0 0 0 0];
                        [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
                        [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];]);
mask = ones(3);                    
fig1pos = [            1     scrnsz(4)/3   scrnsz(3)/3 scrnsz(4)/3];
fig2pos = [  scrnsz(3)/3+1   scrnsz(4)/3   scrnsz(3)/3 scrnsz(4)/3];
fig3pos = [2*scrnsz(3)/3+1   scrnsz(4)/3   scrnsz(3)/3 scrnsz(4)/3];

% plot original image
fig1 = figure();
him1 = imshow(binary_image);
impixelregionpanel(fig1, him1);
set(fig1,'Position',fig1pos)
title('original image ','Visible','on')

% plot dilated image
filteredImage = imdilate(binary_image, mask);
fig2 = figure();
him2 = imshow(filteredImage);
impixelregionpanel(fig2, him2);
set(fig2,'Position',fig2pos)
title('dilated image','Visible','on')

% plot eroded image
filteredImage = imerode(filteredImage, mask);
fig3 = figure();
him3 = imshow(filteredImage);
impixelregionpanel(fig3, him3);
set(fig3,'Position',fig3pos)
title('eroded version of the dilated iamge','Visible','on')

disp('press any key to continue demo');
pause
close all; clc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% median filtering
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot original image
image = imread('cameraman.tif');
fig1 = figure();
imshow(image);
set(fig1,'Position',fig1pos)
title('original image');

% plot distorted image
noisy_image = imnoise(image, 'salt & pepper', 0.04);
fig2 = figure();
imshow(noisy_image);
set(fig2,'Position',fig2pos)
title('noisy image');

% plot distorted image
%median_image = median(noisy_image, ones(3));
median_image = medfilt2(noisy_image, [3 3]);
fig3 = figure();
imshow(median_image);
set(fig3,'Position',fig3pos)
title('distorted image');