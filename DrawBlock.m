function [mat, isOver] = DrawBlock(mat, before)
ColorMat =[...
    0.8039,    0.7490,    0.7137;...
    0.9333,    0.8941,    0.8549;...
    0.9294,    0.8784,    0.7843;...
    0.9490,    0.6941,    0.4745;...
    0.9608,    0.5843,    0.3882;...
    0.9647,    0.4863,    0.3725;...
    0.9647,    0.3686,    0.2314;...
    0.9258,    0.7969,    0.3789;...
    0.9258,    0.7871,    0.3291;...
    0.9258,    0.7773,    0.2793;...
    0.9258,    0.7676,    0.2295;...
    0.9258,    0.7578,    0.1797;...
    ];
for i = 1:4
    for j = 1:4
        switch mat(i, j)
            case 0
                tmp = ColorMat(1, :);
            case 2
                tmp = ColorMat(2, :);
            case 4
                tmp = ColorMat(3, :);
            case 8
                tmp = ColorMat(4, :);
            case 16
                tmp = ColorMat(5, :);
            case 32
                tmp = ColorMat(6, :);
            case 64
                tmp = ColorMat(7, :);
            case 128
                tmp = ColorMat(8, :);
            case 256
                tmp = ColorMat(9, :);
            case 512
                tmp = ColorMat(10, :);
            case 1024
                tmp = ColorMat(11, :);
            case 2048
                tmp = ColorMat(4, :);
        end
        fill([j-1, j-1, j, j],[4-i, 5-i, 5-i, 4-i], tmp, 'edgealpha',0);
        if mat(i, j)~=0
            text(j-0.5, 4.5-i, num2str(mat(i, j)),'horiz','center', 'FontSize',23,'Color',[0.4609 0.4180 0.3945]);
        end
    end
end
[x, y] = meshgrid (0:4,0:4);
plot(x,y,'Color',[0.7305    0.6758    0.6250], 'linewidth', 5);
plot(x',y','Color',[0.7305    0.6758    0.6250], 'linewidth', 5);


isOver = 0;

index = find(mat==0);
l = length(index);
r = isequal(mat, before);
if (l==0)
    isOver = isEnd(mat);
    return;
else
    if(~r)
        addOneIndex = randi(l);
        j = fix((index(addOneIndex)-0.5)/4)+1;
        i = mod(index(addOneIndex)-0.5, 4)+0.5;
        if randi(10)<9
            mat(index(addOneIndex))=2;
            pause(0.25)
            fill([j-1, j-1, j, j],[4-i, 5-i, 5-i, 4-i],ColorMat(2,:), 'edgealpha',0);
            text(j-0.5, 4.5-i, '2','horiz','center', 'FontSize',23,'Color',[0.4609 0.4180 0.3945]);
            drawnow;
        else
            mat(index(addOneIndex))=4;
            pause(0.25)
            fill([j-1, j-1, j, j],[4-i, 5-i, 5-i, 4-i], ColorMat(3,:), 'edgealpha',0);
            text(j-0.5, 4.5-i, '4','horiz','center', 'FontSize',23,'Color',[0.4609 0.4180 0.3945]);
            drawnow;
        end
    end
end
plot(x,y,'Color',[0.7305    0.6758    0.6250], 'linewidth', 5);
plot(x',y','Color',[0.7305    0.6758    0.6250], 'linewidth', 5);


end

