clc;
clear;

%% 定义已知变量
z1 = [0,1;0,1]; % n*n的矩阵
x1 = [0,0;1,1]; % n*n的矩阵
z  = [0.5,1.5;0.5,1.5]; % n*n的矩阵
x  = [-0.75,-0.75;0.25,0.25];
z2 = [1,2;1,2]; % n*n的矩阵
x2 = [0,0;1,1]; % n*n的矩阵
% figure(1)
% h1=scatter(z,x,'r','+');
% hold on
% h2=scatter(z1,x1,'b','o');
% hold on
% h3=scatter(z2,x2,'b','o');
% legend([h1(1),h2(1),h3(1)],'Pneumatic center' 'Air Entry', 'Air Outlet','location', 'northeast')
% title('Swept wing meshing');
Rad=0.0174532925199433
Vinf = 10; % 标量
alpha = 1*Rad % 标量
n=2;

%% 计算系数
for contraPoint=1:n
    for i=1:n
        A = 1 ./ ((x2(i) - x(contraPoint)) .* (z1(i) - z(contraPoint)) - (x1(i) - x(contraPoint)) .* (z2(i) - z(contraPoint)));
        B = ((x2(i) - x1(i)) .* (x1(i) - x(contraPoint)) + (z2(i) - z1(i)) .* (z1(i) - z(contraPoint))) ./ sqrt((x1(i) - x(contraPoint)) .^ 2 + (z1(i) - z(contraPoint)));
        C = ((x2(i) - x1(i)) .* (x2(i) - x(contraPoint)) + (z2(i) - z1(i)) .* (z2(i) - z(contraPoint))) ./ sqrt((x2(i) - x(contraPoint)) .^ 2 + (z2(i) - z(contraPoint)));
        D = 1 ./ (z1(i) - z(contraPoint)) .* (1 - (x1(i) - x(contraPoint)) ./ sqrt((x1(i) - x(contraPoint)) .^ 2 + (z1(i) - z(contraPoint)).^ 2));
        E = 1 ./ (z2(i) - z(contraPoint)) .* (1 - (x2(i) - x(contraPoint)) ./ sqrt((x2(i) - x(contraPoint)) .^ 2 + (z2(i) - z(contraPoint)).^ 2));
        K(contraPoint,i) = (4 * pi) .* (A .* (B - C) + D - E);
    end
end

