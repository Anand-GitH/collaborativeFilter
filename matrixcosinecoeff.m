function [matrixcosinecoeff] = matrixcosinecoeff(u, ref)
	%Author - Anand
	%Date   - 02-27-2020
    %User Based Collaborative filtering
    %Any unrated item should be passed as NaN in the utility matrix
    %System calculates cosine similarity based on row for which the rate to be predicated
    %Function returns the Matrix with cosine similarity between the users 
	%u - Utiity Matrix with unrated items as NaN
	%ref - User row number for which the predicative rating to be found 
 
    [rows, cols] = size(u);
 
    if (ref > rows || ref < 1)
        error("Invalid ref value, please verify");
    end
 
    coefmat = zeros(rows, 1);
 
    for i = 1:rows
        coeff = cosinecoeff(u, i, ref);
        coefmat(i, 1) = coeff;
    end
 
    matrixcosinecoeff = [u, coefmat];
 
end

