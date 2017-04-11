function game2048matlab()
clear;
%% 使用说明
disp('=========2048========')
disp('请使用方向键控制方向');

%% history
if(exist('history.mat','file'))
    load 'history.mat';
else
    best = 0;
    save history best;
end
%% 绘制
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

x_cor = [0,0,1,1;1,1,2,2;2,2,3,3;3,3,4,4;0,0,1,1;1,1,2,2;2,2,3,3;3,3,4,4;...
    0,0,1,1;1,1,2,2;2,2,3,3;3,3,4,4;0,0,1,1;1,1,2,2;2,2,3,3;3,3,4,4];
y_cor = [3,4,4,3;3,4,4,3;3,4,4,3;3,4,4,3;2,3,3,2;2,3,3,2;2,3,3,2;2,3,3,2;...
    1,2,2,1;1,2,2,1;1,2,2,1;1,2,2,1;0,1,1,0;0,1,1,0;0,1,1,0;0,1,1,0];
text_cor = [1.5,3.5;2.5,3.5;3.5,3.5;0.5,2.5;1.5,2.5;2.5,2.5;3.5,2.5;...
    0.5,1.5;1.5,1.5;2.5,1.5;3.5,1.5;0.5,0.5;1.5,0.5;2.5,0.5;3.5,0.5;3.5,0.5];


[x, y] = meshgrid (0:4,0:4);
fig = figure;
set(fig,'windowkeypressfcn',@keypressfcn);
mat = zeros(4,4);
score = 0;
hold on

tmp_tmp = randi(16);
mat(tmp_tmp) = 2;
jjj = fix((tmp_tmp-0.5)/4)+1;
iii = mod(tmp_tmp-0.5, 4)+0.5;
fill([jjj-1, jjj-1, jjj, jjj],[4-iii, 5-iii, 5-iii, 4-iii],ColorMat(2,:), 'edgealpha',0);
hhhh = text(jjj-0.5, 4.5-iii, '2','horiz','center', 'FontSize',23,'Color',[0.4609 0.4180 0.3945]);

fill([0, 0, 4, 4],[4, 5, 5, 4], [0.9727    0.9727    0.9336], 'edgealpha',0);
plot(x,y,'Color',[0.7305    0.6758    0.6250], 'linewidth', 5);
plot(x',y','Color',[0.7305    0.6758    0.6250], 'linewidth', 5);
plot(0:4,[5 5 5 5 5],'Color',[0.7305    0.6758    0.6250], 'linewidth', 5);
plot([0 0],[4 5],'Color',[0.7305    0.6758    0.6250], 'linewidth', 5);
plot([4 4],[4 5],'Color',[0.7305    0.6758    0.6250], 'linewidth', 5);

fill([0.1, 0.1, 1.95, 1.95],[4.1, 4.9,4.9, 4.1], [0.7305    0.6758    0.6250], 'edgealpha',0);
fill([2.05, 2.05, 3.9, 3.9],[4.1, 4.9,4.9, 4.1], [0.7305    0.6758    0.6250], 'edgealpha',0);

text(1, 4.75, 'SCORE','horiz','center', 'FontSize',23,'Color',[0.9294    0.8745    0.8235]);
text(3, 4.75, 'BEST','horiz','center', 'FontSize',23,'Color',[0.9294    0.8745    0.8235]);
text(3, 4.35, num2str(best),'horiz','center', 'FontSize',30,'Color',[0.9843    0.9922    0.9922]);

h1 = text(text_cor(1, 1), text_cor(1, 2), '','horiz','center', 'FontSize',23,'Color',[0.4609 0.4180 0.3945]);
h2 = text(text_cor(2, 1), text_cor(2, 2), '','horiz','center', 'FontSize',23,'Color',[0.4609 0.4180 0.3945]);
h3 = text(text_cor(3, 1), text_cor(3, 2), '','horiz','center', 'FontSize',23,'Color',[0.4609 0.4180 0.3945]);
h4 = text(text_cor(4, 1), text_cor(4, 2), '','horiz','center', 'FontSize',23,'Color',[0.4609 0.4180 0.3945]);
h5 = text(text_cor(5, 1), text_cor(5, 2), '','horiz','center', 'FontSize',23,'Color',[0.4609 0.4180 0.3945]);
h6 = text(text_cor(6, 1), text_cor(6, 2), '','horiz','center', 'FontSize',23,'Color',[0.4609 0.4180 0.3945]);
h7 = text(text_cor(7, 1), text_cor(7, 2), '','horiz','center', 'FontSize',23,'Color',[0.4609 0.4180 0.3945]);
h8 = text(text_cor(8, 1), text_cor(8, 2), '','horiz','center', 'FontSize',23,'Color',[0.4609 0.4180 0.3945]);
h9 = text(text_cor(9, 1), text_cor(9, 2), '','horiz','center', 'FontSize',23,'Color',[0.4609 0.4180 0.3945]);
h10 = text(text_cor(10, 1), text_cor(10, 2), '','horiz','center', 'FontSize',23,'Color',[0.4609 0.4180 0.3945]);
h11 = text(text_cor(11, 1), text_cor(11, 2), '','horiz','center', 'FontSize',23,'Color',[0.4609 0.4180 0.3945]);
h12 = text(text_cor(12, 1), text_cor(12, 2), '','horiz','center', 'FontSize',23,'Color',[0.4609 0.4180 0.3945]);
h13 = text(text_cor(13, 1), text_cor(13, 2), '','horiz','center', 'FontSize',23,'Color',[0.4609 0.4180 0.3945]);
h14 = text(text_cor(14, 1), text_cor(14, 2), '','horiz','center', 'FontSize',23,'Color',[0.4609 0.4180 0.3945]);
h15 = text(text_cor(15, 1), text_cor(15, 2), '','horiz','center', 'FontSize',23,'Color',[0.4609 0.4180 0.3945]);
h16 = text(text_cor(16, 1), text_cor(16, 2), '','horiz','center', 'FontSize',23,'Color',[0.4609 0.4180 0.3945]);
hscore = text(1, 4.35, num2str(score),'horiz','center', 'FontSize',30,'Color',[0.9843    0.9922    0.9922]);


xlim([0 4])
axis off
set (gcf,'Position',[200,50,500,625]);

isOver = 0;
hold on
%% 当检测到键盘输入时
    function keypressfcn(~,~)
        hold on
        pkey = get(gcf,'currentcharacter');
        addScore = 0;
        before = mat;
        switch double(pkey)
            case 29
                [mat, before, addScore] = Move(mat, 1);
            case 28
                [mat, before, addScore] = Move(mat, 3);
            case 30
                [mat, before, addScore] = Move(mat, 4);
            case 31
                [mat, before, addScore] = Move(mat, 2);
        end
        
        if(isOver)
            disp('游戏结束，你的分数为:');
            disp(score);
            if score>best
                best = score;
                save history best;
            end
            pause(3)
            return;
        end
        %% 1

        ii = 1;
        jj = 1;
        cc = 1;
        fill(x_cor(cc,:), y_cor(cc,:), ColorMat(getIndex(mat(ii,jj)), :), 'edgealpha',0);
        if mat(ii, jj)~=0
        text(text_cor(cc, 1), text_cor(cc, 2), num2str(mat(ii, jj)),'horiz','center', 'FontSize',23,'Color',[0.4609 0.4180 0.3945]);
        end
        %% 2
        ii = 1;
        jj = 2;
        cc = 2;
        fill(x_cor(cc,:), y_cor(cc,:), ColorMat(getIndex(mat(ii,jj)), :), 'edgealpha',0);
        if mat(ii, jj)~=0
           text(text_cor(cc, 1), text_cor(cc, 2), num2str(mat(ii, jj)),'horiz','center', 'FontSize',23,'Color',[0.4609 0.4180 0.3945]);
        end
        %% 3
        ii = 1;
        jj = 3;
        cc = 3;
        fill(x_cor(cc,:), y_cor(cc,:), ColorMat(getIndex(mat(ii,jj)), :), 'edgealpha',0);
        if mat(ii, jj)~=0
            text(text_cor(cc, 1), text_cor(cc, 2), num2str(mat(ii, jj)),'horiz','center', 'FontSize',23,'Color',[0.4609 0.4180 0.3945]);
        end
        %% 4
        ii = 1;
        jj = 4;
        cc = 4;
        fill(x_cor(cc,:), y_cor(cc,:), ColorMat(getIndex(mat(ii,jj)), :), 'edgealpha',0);
        if mat(ii, jj)~=0
          text(text_cor(cc, 1), text_cor(cc, 2), num2str(mat(ii, jj)),'horiz','center', 'FontSize',23,'Color',[0.4609 0.4180 0.3945]);
        end
        %% 5
        ii = 2;
        jj = 1;
        cc = 5;
%         set(h5,'visible','off');
        fill(x_cor(cc,:), y_cor(cc,:), ColorMat(getIndex(mat(ii,jj)), :), 'edgealpha',0);
        if mat(ii, jj)~=0
            h5 = text(text_cor(cc, 1), text_cor(cc, 2), num2str(mat(ii, jj)),'horiz','center', 'FontSize',23,'Color',[0.4609 0.4180 0.3945]);
            set(h5,'visible','on');
        end
        %% 6
        ii = 2;
        jj = 2;
        cc = 6;
%         set(h6,'visible','off');
        fill(x_cor(cc,:), y_cor(cc,:), ColorMat(getIndex(mat(ii,jj)), :), 'edgealpha',0);
        if mat(ii, jj)~=0
            h6 = text(text_cor(cc, 1), text_cor(cc, 2), num2str(mat(ii, jj)),'horiz','center', 'FontSize',23,'Color',[0.4609 0.4180 0.3945]);
            set(h6,'visible','on');
        end
        %% 7
        ii = 2;
        jj = 3;
        cc = 7;
%         set(h7,'visible','off');
        fill(x_cor(cc,:), y_cor(cc,:), ColorMat(getIndex(mat(ii,jj)), :), 'edgealpha',0);
        if mat(ii, jj)~=0
            h7 = text(text_cor(cc, 1), text_cor(cc, 2), num2str(mat(ii, jj)),'horiz','center', 'FontSize',23,'Color',[0.4609 0.4180 0.3945]);
            set(h7,'visible','on');
        end
        %% 8
        ii = 2;
        jj = 4;
        cc = 8;
%         set(h8,'visible','off');
        fill(x_cor(cc,:), y_cor(cc,:), ColorMat(getIndex(mat(ii,jj)), :), 'edgealpha',0);
        if mat(ii, jj)~=0
            h8 = text(text_cor(cc, 1), text_cor(cc, 2), num2str(mat(ii, jj)),'horiz','center', 'FontSize',23,'Color',[0.4609 0.4180 0.3945]);
            set(h8,'visible','on');
        end
        %% 9
        ii = 3;
        jj = 1;
        cc = 9;
%         set(h9,'visible','off');
        fill(x_cor(cc,:), y_cor(cc,:), ColorMat(getIndex(mat(ii,jj)), :), 'edgealpha',0);
        if mat(ii, jj)~=0
            h9 = text(text_cor(cc, 1), text_cor(cc, 2), num2str(mat(ii, jj)),'horiz','center', 'FontSize',23,'Color',[0.4609 0.4180 0.3945]);
            set(h9,'visible','on');
        end
        %% 10
        ii = 3;
        jj = 2;
        cc = 10;
%         set(h10,'visible','off');
        fill(x_cor(cc,:), y_cor(cc,:), ColorMat(getIndex(mat(ii,jj)), :), 'edgealpha',0);
        if mat(ii, jj)~=0
            h10 = text(text_cor(cc, 1), text_cor(cc, 2), num2str(mat(ii, jj)),'horiz','center', 'FontSize',23,'Color',[0.4609 0.4180 0.3945]);
            set(h10,'visible','on');
        end
        %% 11
        ii = 3;
        jj = 3;
        cc = 11;
%         set(h11,'visible','off');
        fill(x_cor(cc,:), y_cor(cc,:), ColorMat(getIndex(mat(ii,jj)), :), 'edgealpha',0);
        if mat(ii, jj)~=0
            h11 = text(text_cor(cc, 1), text_cor(cc, 2), num2str(mat(ii, jj)),'horiz','center', 'FontSize',23,'Color',[0.4609 0.4180 0.3945]);
            set(h11,'visible','on');
        end
        %% 12
        ii = 3;
        jj = 4;
        cc = 12;
%         set(h12,'visible','off');
        fill(x_cor(cc,:), y_cor(cc,:), ColorMat(getIndex(mat(ii,jj)), :), 'edgealpha',0);
        if mat(ii, jj)~=0
            h12 = text(text_cor(cc, 1), text_cor(cc, 2), num2str(mat(ii, jj)),'horiz','center', 'FontSize',23,'Color',[0.4609 0.4180 0.3945]);
            set(h12,'visible','on');
        end
        %% 13
        ii = 4;
        jj = 1;
        cc = 13;
%         set(h13,'visible','off');
        fill(x_cor(cc,:), y_cor(cc,:), ColorMat(getIndex(mat(ii,jj)), :), 'edgealpha',0);
        if mat(ii, jj)~=0
            h13 = text(text_cor(cc, 1), text_cor(cc, 2), num2str(mat(ii, jj)),'horiz','center', 'FontSize',23,'Color',[0.4609 0.4180 0.3945]);
%             set(h13,'visible','on');
        end
        %% 14
        ii = 4;
        jj = 2;
        cc = 14;
%         set(h14,'visible','off');
        fill(x_cor(cc,:), y_cor(cc,:), ColorMat(getIndex(mat(ii,jj)), :), 'edgealpha',0);
        if mat(ii, jj)~=0
            h14 = text(text_cor(cc, 1), text_cor(cc, 2), num2str(mat(ii, jj)),'horiz','center', 'FontSize',23,'Color',[0.4609 0.4180 0.3945]);
%             set(h14,'visible','on');
        end
        %% 15
        ii = 4;
        jj = 3;
        cc = 15;
%         set(h15,'visible','off');
        fill(x_cor(cc,:), y_cor(cc,:), ColorMat(getIndex(mat(ii,jj)), :), 'edgealpha',0);
        if mat(ii, jj)~=0
            h15 = text(text_cor(cc, 1), text_cor(cc, 2), num2str(mat(ii, jj)),'horiz','center', 'FontSize',23,'Color',[0.4609 0.4180 0.3945]);
%             set(h15,'visible','on');
        end
        
        %% 16
        ii = 4;
        jj = 4;
        cc = 16;
%         set(h16,'visible','off');
        fill(x_cor(cc,:), y_cor(cc,:), ColorMat(getIndex(mat(ii,jj)), :), 'edgealpha',0);
        if mat(ii, jj)~=0
            h16 = text(text_cor(cc, 1), text_cor(cc, 2), num2str(mat(ii, jj)),'horiz','center', 'FontSize',23,'Color',[0.4609 0.4180 0.3945]);
%             set(h16,'visible','on');
        end
        %%
        plot(x,y,'Color',[0.7305    0.6758    0.6250], 'linewidth', 5);
        plot(x',y','Color',[0.7305    0.6758    0.6250], 'linewidth', 5);
        
        %%
        index = find(mat==0);
        l = length(index);
        r = isequal(mat, before);
        if (l==0)
            isOver = isEnd(mat);
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
        %%
        
        set(hscore,'visible','off');
        score = score + addScore;
        hscore = text(1, 4.35, num2str(score),'horiz','center', 'FontSize',30,'Color',[0.9843    0.9922    0.9922]);
        set(hscore,'visible','on');
        
    end


end

