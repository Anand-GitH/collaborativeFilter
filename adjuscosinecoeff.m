function [adjuscosinecoeff] = adjuscosinecoeff(u, user1, user2)
	%Author - Anand
	%Date   - 02-27-2020
    %Item Based Collaborative filtering
    %Any unrated item should be passed as NaN in the utility matrix
    %System calculates adjusted cosine based column specific 
    %Function returns the cosine similarity between the items 
	%u - Utiity Matrix with unrated items as NaN
	%user1 - Item column number for which the similarity to be calculated wrt item to be predicted which is passed in user2
	%user2 - Item Column number for which the predicative rating to be found 
 
    [rows, cols] = size(u);
 
    if (user1 > cols || user2 > cols)
        error("Value passed for user1 and user2 is not valid, please verify");
    elseif (user1 < 0 || user2 < 0)
        error("Value passed for user1 and user2 is not valid,please verify");
    end
 
    sumofu1u2prod = 0;
    u1elesquardsum = 0;
    u2elesquardsum = 0;
    for i = 1:cols
        for j = 1:rows
            if(isnan(u(j,user1)) || isnan(u(j,user2)))
                continue;
            else
                productu1u2 = u(j,user1) * u(j,user2);
                sumofu1u2prod = sumofu1u2prod + productu1u2;
                u1elesquardsum = u1elesquardsum + (u(j,user1)) ^ 2;
                u2elesquardsum = u2elesquardsum + (u(j,user2)) ^ 2;
            end
        end
        adjuscosinecoeff = round(sumofu1u2prod / (sqrt(u1elesquardsum) * sqrt(u2elesquardsum)), 3);
    end
end 