function [cosinecoeff] = cosinecoeff(u, user1, user2)
	%Author - Anand
	%Date   - 02-27-2020
    %User Based Collaborative filtering
    %Any unrated item should be passed as NaN in the utility matrix
    %System calculates cosine similarity based on row for which the rate to be predicated
    %Function returns the cosine similarity between the users 
	%u - Utiity Matrix with unrated items as NaN
	%user1 - User row number for which the similarity to be calculated wrt user to be predicted which is passed in user2
	%user2 - User row number for which the predicative rating to be found 
 
    [rows, cols] = size(u);
 
    if (user1 > rows || user2 > rows)
        error("Value passed for user1 and user2 is not valid, please verify");
    elseif (user1 < 0 || user2 < 0)
        error("Value passed for user1 and user2 is not valid,please verify");
    end
 
    sumofu1u2prod = 0;
    u1elesquardsum = 0;
    u2elesquardsum = 0;
    for i = 1:rows
        for j = 1:cols
            if(isnan(u(user1, j)) || isnan(u(user2, j)))
                continue;
            else
                productu1u2 = u(user1, j) * u(user2, j);
                sumofu1u2prod = sumofu1u2prod + productu1u2;
                u1elesquardsum = u1elesquardsum + (u(user1, j)) ^ 2;
                u2elesquardsum = u2elesquardsum + (u(user2, j)) ^ 2;
            end
        end
        cosinecoeff = round(sumofu1u2prod / (sqrt(u1elesquardsum) * sqrt(u2elesquardsum)), 3);
    end
end 