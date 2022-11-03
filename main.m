clc;
clear all;
close all;

%% 输入常微分函数
%在f.m函数中输入要求解的函数，即dy/dx=f=...

%% 4阶龙格—库塔求解
dt=0.1; %步长
x=0:dt:5;  %X的求解范围
y(1,:)=(-2.5:0.1:2.5); %Y的向量化批量来那个求解

for i=1:length(x)-1
    K1=f(x(i),y(i,:));
    K2=f(x(i)+0.5*dt,y(i,:)+0.5*K1);
    K3=f(x(i)+0.5*dt,y(i,:)+0.5*K2);
    K4=f(x(i)+dt,y(i,:)+K3);
    y(i+1,:)=y(i,:)+dt/6*(K1+2*K2+2*K3+K4);
    x(i+1)=x(i)+dt;
end

%% 图形表示结果
figure(1)
for j=1:length(x)
    plot(x(:),y(:,j),'-o')
    hold on;
end
axis([0,5,-2.5,5]);
xlabel('$x$',...
    'Interpreter','Latex',...
    'FontSize',30);
ylabel('$y$',...
    'Interpreter','Latex',...
    'FontSize',30);
