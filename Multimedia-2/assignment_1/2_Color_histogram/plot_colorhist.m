% Plot a color histogram for the given quantized image.
% The quantized image contains a bin assignement for every pixel.
% This function calculates the relative frequencies of these bins and plots a
% histogram.

function plot_colorhist(image1_quant)

% define color of every bin
color_all=hsv2rgb( [ [0  , 0   ,1];
                     [0  , 0.5 ,1];
                     [1/3, 0.5 ,1];
                     [2/3, 0.5 ,1];
                     [0  , 5/6 ,1];
                     [1/6, 5/6 ,1];
                     [2/6, 5/6 ,1];
                     [3/6, 5/6 ,1];
                     [4/6, 5/6 ,1];
                     [5/6, 5/6 ,1];  ] );

nrSamples = numel(image1_quant);
% For every bin count the number of samples in that bin an normalize by the
% overall number of samples. Create a bar for every bin.
for i=10:-1:1
    feature = sum(sum(image1_quant==i)) / nrSamples;
    bar(i,feature ,'FaceColor',color_all(i,:))
    hold on
end

% Set title, x-axis limits, and x-axis annotations.
title('Color histogram')
xlim([0,11])
set(gca,'XTick',[1,2,3,4,5,6,7,8,9,10])