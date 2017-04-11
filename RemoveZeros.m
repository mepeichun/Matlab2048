function vec = RemoveZeros(vec, direct)
index = (vec~=0);
tmp = vec(index);
len = length(tmp);
if(len==4||len==0)
    return;
else
    vec = tmp;
    switch direct
        case 1
            vec = [zeros(1, 4-len), vec];
        case 2
            vec = [zeros(4-len, 1); vec];
        case 3
            vec = [vec, zeros(1, 4-len)];
        case 4
            vec = [vec; zeros(4-len, 1)];
    end
end

