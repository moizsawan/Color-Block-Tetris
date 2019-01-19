close all
clear all
clc
c=imread('tetrisbg.jpg');
image(c,'Xdata',[0 100],'Ydata',[0 100]);
axis([0 100 0 100])
axis off;
hold on
h1 = uicontrol('Style','PushButton','String','Easy','Fontsize',20,'Foreground',[1 1 1],'Background',[0.46 0.1 0.7],'Position',[100 150 200 50],'Callback','easytetris');
h2 = uicontrol('Style','PushButton','String','Hard','Fontsize',20,'Foreground',[1 1 1],'Background',[0.74 0.5 0.7],'Position',[100 100 200 50],'Callback','hardtetris');
h3 = uicontrol('Style','PushButton','String','Help','Fontsize',20,'Foreground',[1 1 1],'Background',[0.24 0.8 0.7],'Position',[100 50 200 50],'Callback','help');

 

