% Description: classification

clear all
close all

% init

blocksize= 32; % define size of quadratic blocks

% define directional Sobel filter

Kv=0.25*[[-1 0 1];
         [-2 0 2];
         [-1 0 1]]; 
    
Kh=0.25*[[-1 -2 -1];
         [ 0  0  0];
         [ 1  2  1]];     
     
     
Kdp=0.25*[[ 0 -1 -2];
          [ 1  0 -1];
          [ 2  1  0]];     

     
Kdm=0.25*[[2  1  0];
          [1  0 -1];
          [0 -1  2]];     
     
% Get the features from the images
image1 = imread('testset/h1.png');
features_A = [getFeaturesFromImage(image1, Kv, blocksize);
              getFeaturesFromImage(image1, Kh, blocksize);
              getFeaturesFromImage(image1, Kdp, blocksize);
              getFeaturesFromImage(image1, Kdm, blocksize) ];

image2 = imread('testset/v2.png');
features_B = [getFeaturesFromImage(image2, Kv, blocksize);
              getFeaturesFromImage(image2, Kh, blocksize);
              getFeaturesFromImage(image2, Kdp, blocksize);
              getFeaturesFromImage(image2, Kdm, blocksize) ];
          
%normalize
[features_A(1,:),features_B(1,:)] = norm_features(features_A(1,:),features_B(1,:));
[features_A(2,:),features_B(2,:)] = norm_features(features_A(2,:),features_B(2,:));
[features_A(3,:),features_B(3,:)] = norm_features(features_A(3,:),features_B(3,:));
[features_A(4,:),features_B(4,:)] = norm_features(features_A(4,:),features_B(4,:));

%perform PCA
[features_A_pca, features_B_pca] = pca(features_A, features_B,2);

% plot images
figure(1)
subplot(1,2,1)
imshow(image1)
title('Image A')
subplot(1,2,2)
imshow(image2)
title('Image B')

figure(2)
%plot features
plot_featurespace(features_A_pca, features_B_pca)

% Wait for keypress
pause

hold on
% plot opt linear decision boundary 
plot_opt_linear_classifier(features_A_pca, features_B_pca)

