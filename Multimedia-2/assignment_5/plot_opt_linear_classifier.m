% Description:    plot optimal linear decision boundary
function plot_opt_linear_classifier(features_A,features_B)

% Get value ranges
x_range = [min([features_A(1,:),features_B(1,:)]), max([features_A(1,:),features_B(1,:)])];
y_range = [min([features_A(2,:),features_B(2,:)]), max([features_A(2,:),features_B(2,:)])];

% Probabilities that feature A,B occurs
P_A= numel(features_A)/(numel(features_A)+numel(features_B));
P_B= 1-P_A;

% covariance and centroid of class A
covA = cov([features_A(1,:);features_A(2,:)]');
muA  = mean([features_A(1,:);features_A(2,:)]');
[VA,DA] = eig(covA);
% plot centroid of features a
scatter(muA(1),muA(2),100,'k','o','MarkerFaceColor','k')
hold on

% covariance amd centroid of class B
covB =  cov([features_B(1,:);features_B(2,:)]');
muB  =  mean([features_B(1,:);features_B(2,:)]');
[VB,DB] = eig(covB);
% plot centroid of features b
scatter(muB(1),muB(2),100,'k','o','MarkerFaceColor','k')
hold on

% plot connection from centroid of A to B
plot([muA(1) muB(1)],[muA(2) muB(2)],'g','LineWidth',3)
hold on

% plot ellipse that corresponds to the covarinace matrix of A and B
x=[-1:0.01:1];
y = [sqrt(1-x.^2),-sqrt(1-x(end:-1:1).^2)];
x=[x,x(end:-1:1)];

vec=(VA*sqrt(DA)*[x;y]);
hold on
plot(vec(1,:)+muA(1),vec(2,:)+muA(2),'k')
vec=(VB*sqrt(DB)*[x;y]);
hold on
plot(vec(1,:)+muB(1),vec(2,:)+muB(2),'k')



% Calculate the optimal linear classificator for the features.

% calculate the global centroid
z = ; %TODO
% Calculate the 'within class' covariance matrix
Cmm = ; %TODO
% plot overall centroid
scatter(z(1),z(2),200,'k','o','MarkerFaceColor','k')
hold on

% compute normal vector of hyperplane and w0
% dont forget to bring w to unit length
w = ; %TODO
% compute w0
w0 = ; %TODO

% find two points on the decision line that are still visible
func = @(x) (-w0-x*w(1))/w(2);
x_max = -((y_range(2))*w(2)+w0)/w(1);
x_min = -((y_range(1))*w(2)+w0)/w(1);
% plot the decision line
plot([x_min,x_max],func([x_min,x_max]),'k','LineWidth',3)
hold on

% set image range
xlim([x_range(1) x_range(2)])
ylim([y_range(1) y_range(2)])

% set labels and legend
xlabel('features 1')
ylabel('features 2')
legend(['Image A'],['Image B'])



