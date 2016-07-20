%% K-Means
%%  Separate data points into K clusters with no other information.
%% Inputs:
%%  A - D-by-N matrix of N points in D dimensions.
%%  K - Integer number of clusters to detect. 
%%  maxiter - maximum number of iterations (pick maybe 100, or 1000)
%% Outputs:
%%  C - D-by-K matrix with the learned cluster centroids.
%%  labels - Length N vector with integer (1, 2, ..., K) class assignments.

function [C, labels] = km(A, K, maxiter)
	
	
	%initialization
	[D, N] = size(A);
	labels = zeros(1, N);
	C = zeros(D, K);
	if (K > N)
		error('Requires more or as much data samples as clusters');
		return
	end
	
	%randomly pick initial K cluster centroids from the N data points w/o replacement
	athruK = randperm(N);
	centers = athruK(1:K);
	for i = 1:K
		C(:,i) = A(:, centers(i));
	end
	
	%algoooorithm
	bool = 1;
	i = 0;
	while bool
		priorlabels = labels;
		%cluster points into the different clusters - expectation
		for j = 1:N				%jth data point
			NORMS = zeros(1,K);
			%compute the norm of the distance from the jth point to each cluster
			for k = 1:K			%kth cluster
				val = C(:,k) - A(:,j);
				NORMS(k) = norm(val);
			end
			%put the jth data point into the cluster I, who has the minimum norm M
			[M, I] = min(NORMS);
			labels(j) = I;
		end
		
		%create new cluster centers from the new clusters - maximization
		for k = 1:K					%kth cluster
			%create a counter for the sum of the points in the cluster
			sumvec = zeros(D,1);
			%create a counter for the number of points in the cluster
			numincluster = 0;
			for j = 1:N				%jth data point
				%obtain the sum
				if(labels(j) == k)
					numincluster = numincluster + 1;
					sumvec = sumvec + A(:,j);
				end
			end
			%get the average of the sum to be the new cluster center
			C(:,k) = sumvec/numincluster;
		end
		
		%increment and check if the labels have changed, or if we are at maxiter
		i = i + 1;
		if(i >= maxiter)
			bool = 0;
		elseif(priorlabels == labels)
			bool = 0;
		end
		
	end
	
end
