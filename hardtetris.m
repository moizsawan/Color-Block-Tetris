clc
axis([1 11 -11 -1]);
fig = figure;
hold on;
table = zeros(12);
colour = ['r','g','b','c','m','k'];
for i = 1:10
    table(10,i) = randi(6);
end
for j = 1:12
    table(11,j) = 100;
    table(12,j) = 200;
end
% disp(table);
axis([1 11 -11 -1])
score=0;
% axis off;
for x = 1:10
    for y = 1:10
        if table(y,x) ~= 0
            rectangle('Position', [x -y-1 1 1], 'FaceColor' , colour(table(y,x)));
        end
    end
end
axis([1 11 -11 -1])
axis off;
while 1
    random = randi(6);
    x=randi([2 10]);
    y=2;
    t=0;
    f = randi([1 9]);
    b = randi([-11 -3]);
    while table(y,x) == 0 && y~=11
        table(y-1,x) = 0;
        counter_for_loop = 0;
        %have to change value of 'x' here!
        set(fig, 'KeyPressFcn', 'a = get(gcf, ''CurrentCharacter'')');
        a = 1;
        while counter_for_loop < 3
            %             disp(double(a));
            pause(0.1);
            if a == 28
                x = x - 1;
                %                 y = y - 1;
                t = 2;
                break;
            end
            if a == 29
                x = x + 1;
                %                 y = y - 1;
                t = 1;
                break;
            end
            if a == 13
                break;
            end
            counter_for_loop = counter_for_loop + 1;
        end
        if x> 10
            x=x-1;
        elseif x<1
            x=x+1;
        end
        if table(y,x) ~= 0 && t == 1
            x = x - 1;
        elseif table(y,x) ~= 0 && t == 2
            x = x + 1;
        end
        table(y,x) = random;
        y = y + 1;
        %end of x implementation
        %         disp(table);
        for xx = 1:10
            for yy = 1:10
                if table(yy,xx) ~= 0
                    rectangle('Position', [xx -yy-1 1 1], 'FaceColor' , colour(table(yy,xx)));
                end
                if table(yy,xx) == 0
                    rectangle('Position', [xx -yy-1 1 1], 'FaceColor' , 'w')
                end
            end
        end
        if a == 13
            break;
        end
    end
    for r = 1:10
        for s = 1:10
            if  table(s,r) == table(s,r+1) && table(s,r+1) == table(s,r+2) && ...
                table(s,r) ~= 0 && table(s,r+1) ~=0 && table(s,r+2)
                table(s,r) = 0;
                table(s,r+1) = 0;
                table(s,r+2) = 0;
                [y,Fs] = audioread('popwav.wav');
                sound(y,Fs);
                score=score+2;
                [g,map,alf]=imread('poppop.png');
                pop=image(g);
                set(pop,'alphadata',alf);
                set(pop,'XData',[f f+2],'YData',[b b+2]);
                set(gca,'Ydir','normal')
                pause(0.01);
                delete(pop);
            end
            if  table(s,r) == table(s+1,r) && table(s+1,r) == table(s+2,r) && ...
                table(s,r) ~= 0 && table(s+1,r) ~= 0 && table(s+2,r) ~= 0
                table(s,r) = 0;
                table(s+1,r) = 0;
                table(s+2,r) = 0;
                [y,Fs] = audioread('popwav.wav');
                sound(y,Fs);
                score=score+2;
                [g,map,alf]=imread('poppop.png');
                pop=image(g);
                set(pop,'alphadata',alf);
                set(pop,'XData',[f f+2],'YData',[b b+2]);
                set(gca,'Ydir','normal')
                pause(0.01);
                delete(pop);
            end
            for g = 1:10
                for h = 1:10
                    if  table(g+1,h) == 0
                        table(g+1,h) = table(g,h);
                        table(g,h) = 0;
                    end
                end
            end
            title(['Your' ' ' 'score' ' ' ':' ' ' num2str(score)]);
            if a == 13
                break;
            end
        end
    end
    if table(2,x) ~= 0
        title(['Gameover' ' ' ':' ' ' 'Your' ' ' 'final' ' ' 'score' ' ' ...
            'is' ' ' num2str(score) ' ' '.']);
        break;
    end
    if a == 13
        close all
        clear all
        clc
        break;
    end
end
