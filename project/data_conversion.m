adult_data = readtable('adult.data.dat');
adult_test = readtable('adult.test.dat');

for j = 2:-1:1
	if j == 1
		a = table2cell(adult_data);
		N = size(a,1);
	elseif j == 2
		a = table2cell(adult_test);
		N = size(a,1);
	end
	
	%age
	age = [];
	for i = 1:N
		age(end+1) = a{i,1};
	end
	age = age';

	%work class
	workclass = zeros(N, 8);
	for i = 1:N
		if strcmp(a{i,2}, 'Private')
			workclass(i,1) = 1;
		elseif strcmp(a{i,2},'Self-emp-not-inc')
			workclass(i,2) = 1;
		elseif strcmp(a{i,2},'Self-emp-inc')
			workclass(i,3) = 1;
		elseif strcmp(a{i,2}, 'Federal-gov')
			workclass(i,4) = 1;
		elseif strcmp(a{i,2}, 'Local-gov')
			workclass(i,5) = 1;
		elseif strcmp(a{i,2}, 'State-gov')
			workclass(i,6) = 1;
		elseif strcmp(a{i,2}, 'Without-pay')
			workclass(i,7) = 1;
		elseif strcmp(a{i,2}, 'Never-worked')
			workclass(i,8) = 1;
		end
	end

	%fnclwgt
	fnlwgt = [];
	for i = 1:N
		fnlwgt(end + 1) = a{i,3};
	end
	fnlwgt = fnlwgt';

	%education-cont
	education = [];
	for i = 1:N
		education(end + 1) = a{i,5};
	end
	education = education';

	%martial-status
	martialstatus = zeros(N, 7);
	for i = 1:N
		if strcmp(a{i,6}, 'Married-civ-spouse')
			martialstatus(i,1) = 1;
		elseif strcmp(a{i,6}, 'Divorced')
			martialstatus(i,2) = 1;
		elseif strcmp(a{i,6}, 'Never-married')
			martialstatus(i,3) = 1;
		elseif strcmp(a{i,6}, 'Separated')
			martialstatus(i,4) = 1;
		elseif strcmp(a{i,6}, 'Widowed')
			martialstatus(i,5) = 1;
		elseif strcmp(a{i,6}, 'Married-spouse-absent')
			martialstatus(i,6) = 1;
		elseif strcmp(a{i,6}, 'Married-AF-spouse')
			martialstatus(i,7) = 1;
		end
	end

	%occupation
	occupation = zeros(N, 14);
	for i = 1:N
		if strcmp(a{i,7}, 'Tech-support')
			occupation(i,1) = 1;
		elseif strcmp(a{i,7}, 'Craft-repair')
			occupation(i,2) = 1;
		elseif strcmp(a{i,7}, 'Other-service')
			occupation(i,3) = 1;
		elseif strcmp(a{i,7}, 'Other-service')
			occupation(i,4) = 1;
		elseif strcmp(a{i,7}, 'Sales')
			occupation(i,5) = 1;
		elseif strcmp(a{i,7}, 'Exec-managerial')
			occupation(i,6) = 1;
		elseif strcmp(a{i,7}, 'Prof-specialty')
			occupation(i,7) = 1;
		elseif strcmp(a{i,7}, 'Machine-op-inspct')
			occupation(i,8) = 1;
		elseif strcmp(a{i,7}, 'Adm-clerical')
			occupation(i,9) = 1;
		elseif strcmp(a{i,7}, 'Farming-fishing')
			occupation(i,10) = 1;
		elseif strcmp(a{i,7}, 'Transport-moving')
			occupation(i,11) = 1;
		elseif strcmp(a{i,7}, 'Priv-house-serv')
			occupation(i,12) = 1;
		elseif strcmp(a{i,7}, 'Protective-serv')
			occupation(i,13) = 1;
		elseif strcmp(a{i,7}, 'Armed-Forces')
			occupation(i,14) = 1;
		end
	end
	%relationship
	relationship = zeros(N, 6);
	for i = 1:N
		if strcmp(a{i,8}, 'Wife')
			relationship(i,1) = 1;
		elseif strcmp(a{i,8}, 'Own-child')
			relationship(i,2) = 1;
		elseif strcmp(a{i,8}, 'Husband')
			relationship(i,3) = 1;
		elseif strcmp(a{i,8}, 'Not-in-family')
			relationship(i,4) = 1;
		elseif strcmp(a{i,8}, 'Other-relative')
			relationship(i,5) = 1;
		elseif strcmp(a{i,8}, 'Unmarried')
			relationship(i,6) = 1;
		end
	end

	%race
	race = zeros(N, 5);
	for i = 1:N
		if strcmp(a{i,9}, 'White')
			race(i,1) = 1;
		elseif strcmp(a{i,9}, 'Asian-Pac-Islander')
			race(i,2) = 1;
		elseif strcmp(a{i,9}, 'Amer-Indian-Eskimo')
			race(i,3) = 1;
		elseif strcmp(a{i,9}, 'Other')
			race(i,4) = 1;
		elseif strcmp(a{i,9}, 'Black')
			race(i,5) = 1;
		end
	end

	%sex
	sex = zeros(N, 2);
	for i = 1:N
		if strcmp(a{i,10},'Female')
			sex(i,1) = 1;
		elseif strcmp(a{i,10},'Male')
			sex(i,2) = 1;
		end
	end

	%captial-gain
	capitalgain = [];
	for i = 1:N
		capitalgain(end + 1) = a{i, 11};
	end
	capitalgain = capitalgain';

	%capital-loss
	capitalloss = [];
	for i = 1:N
		capitalloss(end + 1) = a{i, 12};
	end
	capitalloss = capitalloss';

	%hours-per-week
	hoursperweek = [];
	for i = 1:N
		hoursperweek(end + 1) = a{i,13};
	end
	hoursperweek = hoursperweek';

	%native country
	nativecountry = zeros(N, 41);
	for i = 1:N
		if strcmp(a{i,14}, 'United-States')
			nativecountry(i,1) = 1;
		elseif strcmp(a{i,14}, 'Cambodia')
			nativecountry(i,2) = 1;
		elseif strcmp(a{i,14}, 'England')
			nativecountry(i,3) = 1;
		elseif strcmp(a{i,14}, 'Puerto-Rico')
			nativecountry(i,4) = 1;
		elseif strcmp(a{i,14}, 'Canada')
			nativecountry(i,5) = 1;
		elseif strcmp(a{i,14}, 'Germany')
			nativecountry(i,6) = 1;
		elseif strcmp(a{i,14}, 'Outlying-US(Guam-USVI-etc)')
			nativecountry(i,7) = 1;
		elseif strcmp(a{i,14}, 'India')
			nativecountry(i,8) = 1;
		elseif strcmp(a{i,14}, 'Japan')
			nativecountry(i,9) = 1;
		elseif strcmp(a{i,14}, 'Greece')
			nativecountry(i,10) = 1;
		elseif strcmp(a{i,14}, 'South')
			nativecountry(i,11) = 1;
		elseif strcmp(a{i,14}, 'China')
			nativecountry(i,12) = 1;
		elseif strcmp(a{i,14}, 'Cuba')
			nativecountry(i,13) = 1;
		elseif strcmp(a{i,14}, 'Iran')
			nativecountry(i,14) = 1;
		elseif strcmp(a{i,14}, 'Honduras')
			nativecountry(i,15) = 1;
		elseif strcmp(a{i,14}, 'Philippines')
			nativecountry(i,16) = 1;
		elseif strcmp(a{i,14}, 'Italy')
			nativecountry(i,17) = 1;
		elseif strcmp(a{i,14}, 'Poland')
			nativecountry(i,18) = 1;
		elseif strcmp(a{i,14}, 'Jamaica')
			nativecountry(i,19) = 1;
		elseif strcmp(a{i,14}, 'Vietnam')
			nativecountry(i,20) = 1;
		elseif strcmp(a{i,14}, 'Mexico')
			nativecountry(i,21) = 1;
		elseif strcmp(a{i,14}, 'Portugal')
			nativecountry(i,22) = 1;
		elseif strcmp(a{i,14}, 'Ireland')
			nativecountry(i,23) = 1;
		elseif strcmp(a{i,14}, 'France')
			nativecountry(i,24) = 1;
		elseif strcmp(a{i,14}, 'Dominican-Republic')
			nativecountry(i,25) = 1;
		elseif strcmp(a{i,14}, 'Laos')
			nativecountry(i,26) = 1;
		elseif strcmp(a{i,14}, 'Ecuador')
			nativecountry(i,27) = 1;
		elseif strcmp(a{i,14}, 'Taiwan')
			nativecountry(i,28) = 1;
		elseif strcmp(a{i,14}, 'Haiti')
			nativecountry(i,29) = 1;
		elseif strcmp(a{i,14}, 'Columbia')
			nativecountry(i,30) = 1;
		elseif strcmp(a{i,14}, 'Hungary')
			nativecountry(i,31) = 1;
		elseif strcmp(a{i,14}, 'Guatemala')
			nativecountry(i,32) = 1;
		elseif strcmp(a{i,14}, 'Nicaragua')
			nativecountry(i,33) = 1;
		elseif strcmp(a{i,14}, 'Scotland')
			nativecountry(i,34) = 1;
		elseif strcmp(a{i,14}, 'Thailand')
			nativecountry(i,35) = 1;
		elseif strcmp(a{i,14}, 'Yugoslavia')
			nativecountry(i,36) = 1;
		elseif strcmp(a{i,14}, 'El-Salvador')
			nativecountry(i,37) = 1;
		elseif strcmp(a{i,14}, 'Trinadad&Tobago')
			nativecountry(i,38) = 1;
		elseif strcmp(a{i,14}, 'Peru')
			nativecountry(i,39) = 1;
		elseif strcmp(a{i,14}, 'Hong')
			nativecountry(i,40) = 1;
		elseif strcmp(a{i,14}, 'Holand-Netherlands')
			nativecountry(i,41) = 1;
		end
	end

	if j == 1
		over50k = zeros(N,1);
		for i=1:N
			if strcmp(a{i,15}, '<=50K')
				over50k(i,1) = -1;
			elseif strcmp(a{i,15}, '>50K')
				over50k(i,1) = 1;
			end
		end
	elseif j == 2
		testY = zeros(N,1);
		for i=1:N
			if strcmp(a{i,15}, '<=50K')
				testY(i,1) = -1;
			elseif strcmp(a{i,15}, '>50K')
				testY(i,1) = 1;
			end
		end
	end

	if j == 1
		data = [age workclass fnlwgt education martialstatus occupation relationship race sex capitalgain capitalloss hoursperweek nativecountry];
	elseif j == 2
		test = [age workclass fnlwgt education martialstatus occupation relationship race sex capitalgain capitalloss hoursperweek nativecountry];
	end
end