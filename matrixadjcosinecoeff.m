function [matrixadjcosinecoeff] = matrixadjcosinecoeff(u, ref)
	%Author - Anand
	%Date   - 02-27-2020
    %Cosine Similarity 
    %u  - Utility Matrix which has rating and unrated ones as NaN 
	%     Pearson - Centered ratinggs in a matrix with mean rating substracted from actual rating and unrated as NaN
    %ref- Cosine Similarity with User row number for which predicative rating to be found 
 
    %User Based Collaborative filtering
    %u - Utility Matrix which has rating and unrated ones as nr
    %ref- Pearson similarity wrt to this ref - ref is the row number

    [rows, cols] = size(u);
 
    if (ref > cols || ref < 1)
        error("Invalid ref value, please verify");
    end
 
    adjcoefmat = zeros(1, cols);
 
    for i = 1:cols
        coeff = adjuscosinecoeff(u, i, ref);
        adjcoefmat(1, i) = coeff;
    end
 
    matrixadjcosinecoeff = [u;adjcoefmat];
 
end



