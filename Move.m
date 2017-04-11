function [mat,before, addScore] = Move(mat, direct)
%2-2-4-4 => [4]-0-4-4 => [4]-4-0-4 => [4]-[8]-0-0
before =mat;
addScore = 0;
switch direct
    case 1
        for i = 1:4
            [vec, addScore_tmp] =  Merge(RemoveZeros(mat(i, :), 1),1);
            mat(i, :) = RemoveZeros(vec,1);
            addScore = addScore + addScore_tmp;
        end
    case 2
        for j=1:4
           [vec, addScore_tmp] = Merge(RemoveZeros(mat(:, j), 2),2);
           mat(:, j) = RemoveZeros(vec, 2);
           addScore = addScore + addScore_tmp;
        end
    case 3
        for i = 1:4
            [vec, addScore_tmp] = Merge(RemoveZeros(mat(i, :), 3),3);
            mat(i, :) = RemoveZeros(vec,3);
            addScore = addScore + addScore_tmp;
        end
    case 4
        for j=1:4
           [vec, addScore_tmp] = Merge(RemoveZeros(mat(:, j), 4),4);
           mat(:, j) = RemoveZeros(vec,4);
           addScore = addScore + addScore_tmp;
        end
end

% index = find(mat==0);
% l = length(index);
% r = isequal(mat, tmp);
% if (l==0)
%     isOver = isEnd(mat);
%     return;
% else
%     isOver = 0;
%     if(~r)
%         if randi(10)<9
%             mat(index(randi(l)))=2;
%         else
%             mat(index(randi(l)))=4;
%         end
%     end
% end

end

