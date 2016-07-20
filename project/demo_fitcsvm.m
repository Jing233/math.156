% fisheriris is a MATLAB-provided data set; it should contain:
% meas: Matrix whose columns are:
%   sepal length
%   sepal width
%   petal length
%   petal width
% species: Cell column vector whose entries are 'setosa', 'versicolor', or
%   'virginica'
load fisheriris

% Throw away the sepal length and width so we only use 2 predictor features
% (to make it possible to plot the data); throw away the setosas in order
% to make this a binary classification problem.
non_setosa_indices = ~strcmp(species, 'setosa');
X = meas(non_setosa_indices,3:4);
y = species(non_setosa_indices);

svm_model = fitcsvm(X, y);

svm_model_standardized = fitcsvm(X, y, 'Standardize', true);

sv = svm_model.SupportVectors;
figure
gscatter(X(:,1),X(:,2),y);
hold on
plot(sv(:,1),sv(:,2),'ko','MarkerSize',10);
legend('versicolor','virginica','Support Vector');
hold off

sv2 = svm_model_standardized.SupportVectors;
figure
X1standardized = (X(:,1)-mean(X(:,1)))/std(X(:,1));
X2standardized = (X(:,2)-mean(X(:,2)))/std(X(:,2));
gscatter(X1standardized,X2standardized,y);
hold on
plot(sv2(:,1),sv2(:,2),'ko','MarkerSize',10);
legend('versicolor','virginica','Support Vector');
hold off