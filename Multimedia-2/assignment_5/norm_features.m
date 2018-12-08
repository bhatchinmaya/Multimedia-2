% Description: variance normalization of features
function [features_A_norm,features_B_norm] = norm_features(features_A,features_B)

% Get the variance and the mean value of the combined features.
var_all = var([features_A,features_B]');
mean_all= mean([features_A,features_B]');

features_A_norm = ones(size(features_A));
features_B_norm = ones(size(features_B));

% TODO
% Calculate the normalized features and put them in features_A_norm and
% features_B_norm. 
features_A_norm = (features_A - mean_all)/var_all;
features_B_norm = (features_B - mean_all)/var_all; 
