% Show a reconstruction of the quantized image.
% The quantized image contains a bin assignement for every pixel.
% This function reconstructs the color of every bin an shows the
% reconstructed image.

function plot_quantizedImage(quantized_image)

% define color of every bin
color_all= [ [0  , 0   ,1];
             [0  , 0.5 ,1];
             [1/3, 0.5 ,1];
             [2/3, 0.5 ,1];
             [0  , 5/6 ,1];
             [1/6, 5/6 ,1];
             [2/6, 5/6 ,1];
             [3/6, 5/6 ,1];
             [4/6, 5/6 ,1];
             [5/6, 5/6 ,1];  ];
       
[size_y, size_x] = size(quantized_image);
hsv_rec = zeros(size_y, size_x, 3);
% Iterate over the bin map.
for y=1:size_y
    for x=1:size_x
        hsv_rec(y,x,:) = color_all(quantized_image(y,x),:);
    end;
end;
rgb_rec = hsv2rgb(hsv_rec);
imshow( rgb_rec );
