% Description: performs PCA and reduce dimensionality
function [features_A_transformed, features_B_transformed]=pca(features_A, features_B,dim)

features_mean =mean([features_A,features_B],2);
% determine Covarinace
Covariance = cov([features_A,features_B]')
%determine eigenvalues and eigenvectors
[v,e]=eig(Covariance)

% chose greatest eigenvalue
[val, ix]=sort(diag(e));
% Get eigenvectors for greatest eigenvalues
Q_pca = v(:,[ix(end:-1:end-dim+1)])';
% perform PCA
features_A_transformed = Q_pca * (features_A-features_mean * ones(1,numel(features_A) / 4));
features_B_transformed = Q_pca * (features_B-features_mean  *ones(1,numel(features_B) / 4));

% display Covarinace of transformed features
Cov_PCA_trans = cov([features_A_transformed, features_B_transformed]')