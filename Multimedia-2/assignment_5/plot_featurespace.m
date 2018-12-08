% Description: plots features (class A and B)
function plot_featurespace(features_A_transformed,features_B_transformed)

% do a scatter plot of features A
scatter(features_A_transformed(1,:),features_A_transformed(2,:),'g')
hold on
% do a scatter plot of features B
scatter(features_B_transformed(1,:),features_B_transformed(2,:),'r')
xlabel('features 1')
ylabel('features 2')
legend(['Image A'],['Image B'])

% Get minimum and maximum value of the features and set them in the plot
x_range = [min([features_A_transformed(1,:),features_B_transformed(1,:)]),
           max([features_A_transformed(1,:),features_B_transformed(1,:)])];
y_range = [min([features_A_transformed(2,:),features_B_transformed(2,:)]),
           max([features_A_transformed(2,:),features_B_transformed(2,:)])];
xlim([x_range(1) x_range(2)])
ylim([y_range(1) y_range(2)])
