%this is the first "main" script of the lab.
%HOW TO USE: make sure data_conversion.m, softsvm.m, and adult.test and adult.data (renamed to
% adult.test.dat and adult.data.dat) are all in the same directory. Simply run this script to
% -- modify train_num to vary how many samples you want to use for training
% -- this script does the whole lab for the specified training samples using ONLY the implementations
% 		from lab 7. 
%			-- IF you want to use the other SVM functions (aka the one from matlab) use the other script

clear all
data_conversion

warning('off','all')

train_num = 20000;
acc = [];
underacc = [];
overacc = [];

original_data = data;
for iteration = 0:3
	
	if iteration == 0
		data = original_data;
	elseif iteration == 1
		data = [age education martialstatus race sex nativecountry];
	elseif iteration == 2
		data = [age workclass education relationship race sex capitalgain capitalloss ];
	elseif iteration == 3
		data = [capitalgain capitalloss];
	end

	%attempt to run on the adult.test, but we run out of memory or our results do not conclude anything (currently)

	%[w, b] = softsvm(data, over50k, 0.005);
	%prediction = test * w' + b;
	%results = zeros(1, size(test, 1));
	%for i = 1:size(test,1)
	%	if sign(prediction(i)) == sign(testY(i))
	%		results(i) = 1;
	%	else
	%		results(i) = 0;
	%	end
	%end




	%this code did things using ONLY the adult_data file, proportionalizing it into a test/train


	N = 32560;
	[w, b] = softsvm(data(1:train_num,:), over50k(1:train_num), 0.005);	%used gamma = 0.005 in the lab
	prediction = data((train_num+1):N,:) * w' + b;
	results = zeros(1, N - train_num);
	for i = 1:N-train_num
		if sign(prediction(i)) == sign(over50k(train_num + i))
			results(i) = 1;
		else
			results(i) = 0;
		end
	end
	

	
	total_accuracy = sum(results) / (N - train_num);
	acc(end+1) = total_accuracy;


	num_under_test = 0;
	num_over_test = 0;
	num_under_correct = 0;
	num_over_correct = 0;
	for i = (train_num+1):N
		if over50k(i) == 1
			num_over_test = num_over_test + 1;
			if results(i-train_num) == 1
				num_over_correct = num_over_correct + 1;
			else
				continue;
			end
		elseif over50k(i) == -1
			num_under_test = num_under_test + 1;
			if results(i-train_num) == 1
				num_under_correct = num_under_correct + 1;
			else
				continue;
			end
		end
	end

	overaccuracy = num_over_correct / num_over_test;
	overacc(end + 1) = overaccuracy;

	underaccuracy = num_under_correct / num_under_test;
	underacc(end+1) = underaccuracy;

	
	fprintf('-------------------------------------\n');
	
end

fprintf('--------------------------------\n');
for k = 0:3
	if k == 0
		fprintf('Using the original data (no subsets)\n');
		fprintf('Overall accuracy is: %f \n', acc(k+1));
		fprintf('Accuracy for those Over 50K income: %f\n', overacc(k+1));
		fprintf('Accuracy for those Under 50K income: %f\n', underacc(k+1));
	elseif k == 1
		fprintf('Using only age, education, martialstatus, race, sex, and country\n');
		fprintf('Overall accuracy is: %f \n', acc(k+1));
		fprintf('Accuracy for those Over 50K income: %f\n', overacc(k+1));
		fprintf('Accuracy for those Under 50K income: %f\n', underacc(k+1));
	elseif k == 2
		fprintf('Using age, workclass, education, relationship, race, sex, and capital gain/loss\n');
		fprintf('Overall accuracy is: %f \n', acc(k+1));
		fprintf('Accuracy for those Over 50K income: %f\n', overacc(k+1));
		fprintf('Accuracy for those Under 50K income: %f\n', underacc(k+1));
	elseif k == 3
		fprintf('Using ONLY capitalgain/loss')
		fprintf('Overall accuracy is: %f \n', acc(k+1));
		fprintf('Accuracy for those Over 50K income: %f\n', overacc(k+1));
		fprintf('Accuracy for those Under 50K income: %f\n', underacc(k+1));
	end
	fprintf('--------------------------------\n');
end
