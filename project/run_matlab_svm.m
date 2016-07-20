% Modify this line to choose the specific subset of the data attributes you
% want to use for prediction
limited_data = data;
% Example:
%limited_data = [age education];

data_reordered = data;
over50k_reordered = over50k;
% Uncomment to use a randomly selected training set instead
%perm = randperm(N);
%data_reordered = limited_data(perm, :);
%over50k_reordered = over50k(perm, :);

m = 1000;
X_train = data_reordered(1:m, :);
y = over50k_reordered(1:m);

svm_model = fitcsvm(X_train, y, ...
        'Standardize', true, ...
        'KernelFunction', 'linear', ... % can replace 'linear' with 'gaussian'
        'KernelScale', 'auto', ...
        'BoxConstraint', 1);

X_test = data_reordered(m+1:N, :);

[label,Score] = predict(svm_model, X_test);
correct = label==over50k_reordered(m+1:N);
correct_fraction = mean(correct);

correct_for_over50k = correct(over50k_reordered(m+1:N)==1);
correct_for_over50k_fraction = mean(correct_for_over50k);

correct_for_under50k = correct(over50k_reordered(m+1:N)==-1);
correct_for_under50k_fraction = mean(correct_for_under50k);
