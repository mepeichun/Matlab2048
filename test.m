pointx = zeros(16,4);
pointy = pointx;
textpoint = zeros(16, 2);
a = 1;
for i = 1:4
    for j = 1:4
        [i, j]
        pointx(a,:)=[j-1, j-1, j, j];
        pointy(a,:) = [4-i, 5-i, 5-i, 4-i];
        textpoint(a,:) = [j-0.5, 4.5-i];
        a = a+1;
    end
end