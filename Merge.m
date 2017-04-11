function [vec, addScore] = Merge(vec, direct)
addScore = 0;
if(direct==3||direct==4)
    for i = 1:3
        if(vec(i)==vec(i+1))
            vec(i) = vec(i)*2;
            addScore = addScore + vec(i);
            vec(i+1) = 0;
        end
    end
else
    for i = 4:-1:2
        if(vec(i)==vec(i-1))
            vec(i) = vec(i)*2;
            addScore = addScore + vec(i);
            vec(i-1) = 0;
        end
    end
end
end

