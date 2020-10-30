function [collaborativeFilterMat] = collaborativeFilter(u,ref,flag)
	%Author - Anand
	%Date   - 02-27-2020
    %Collaborative filtering
	%flag - 1. User Based Collaborative Filtering - Pearson Coefficient - Unbaised 
	%       2. Item Based Collaborative Filtering - Adjusted Cosine
    %u    - Utility Matrix which has rating and unrated ones as "nr"
    %ref  - Indicates - 1. User Based Collaborative Filtering User row number for which predicative rating to be found 
	%	  - Indicates - 2. Item Based Collaborative Filtering Item Column number for which the predicative rating to be found 
    
    syms nr;
	
    [rows, cols] = size(u);
 
    if(flag==1)
        if (ref > rows || ref < 1)
            error("Invalid ref value, please verify");
        end
    elseif(flag==2)
        if (ref > cols || ref < 1)
            error("Invalid ref value, please verify");
        end
    end
 
    meanrating = zeros(rows, 1);
    collaborativeFilterMat = zeros(rows, cols + 1);
    sumofelem = 0;
    countelem = 0;
 
    for i = 1:rows
        for j = 1:cols
            if (u(i, j) ~= nr)
                sumofelem = sumofelem + u(i, j);
                countelem = countelem + 1;
            end
        end
        meanrating(i, 1) = sumofelem / countelem;
        sumofelem = 0;
        countelem = 0;
    end
    
    transformmatrix = zeros(rows, cols);
    
	for i = 1:rows
        for j = 1:cols
            if (u(i, j) ~= nr)
                transformmatrix(i, j) = u(i, j) - meanrating(i, 1);
            else
                transformmatrix(i, j) = NaN;
            end
        end
    end
    
	if(flag==1)
        collaborativeFilterMat = matrixcosinecoeff(transformmatrix, ref);
        collaborativeFilterMat = [collaborativeFilterMat, meanrating];
    elseif(flag==2)
        meanrating=[meanrating;0];
        collaborativeFilterMat = [matrixadjcosinecoeff(transformmatrix,ref),meanrating];
    end
end

