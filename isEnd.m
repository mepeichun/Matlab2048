function result = isEnd(mat)
for i = 1:4
    for j = 1:3
        if (mat(i, j)==mat(i, j+1))
            result = 0;
            return;
        end
    end
end

for j = 1:4
    for i = 1:3
        if(mat(i, j)==mat(i+1, j))
            result = 0;
            return;
        end
    end
end

result = 1;
return;


end

