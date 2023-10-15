%--------------------------------------------------------------------------
% main.m
% 
% Purpose:
%   Main Function.
%
% Last modified:   2023/10/14    by: Minghe Lee  
% 
%--------------------------------------------------------------------------
%% initialize
clc
clear;
%% read data
wing_Const;

Vinf = [0.2,0.4,0.6].*a;
dZ=(sweepbackWing_wide/2)/(sqrt(n)-1)^2;
S=(sweepbackWing_wide/2)*(sweepbackWing_length+deltaWing_length);
%% Print Mesh
% Define the color
Col_1=[54,195,201]./255;
Col_2=[239 111 198]./255;
Col_3=[240 100 73]./255;
[x_new,y_new]=divide(type);
Z=0*x_new;
for i = 1:sqrt(n)
    for j =1:sqrt(n)
        ColMesh(i,j,1) = Col_1(1);
        ColMesh(i,j,2) = Col_1(2);
        ColMesh(i,j,3) = Col_1(3);
    end
end
% print mesh
figure(1)
h0=mesh(x_new,y_new,0*x_new,ColMesh);
view(2)
hold on
h0=mesh(-x_new,y_new,0*x_new,ColMesh);
view(2)
hold on
%% Print CalAxis
% print the Pneumatic center
[x0,z0,x1,z1,x2,z2]=airDynamic_CalAxis(y_new,x_new);
%RIGHT
h1=scatter(z0,x0,5,Col_2,'+');
hold on
h2=scatter(z1,x1,8,Col_3,'.');
hold on
h3=scatter(z2,x2,8,Col_3,'.');
%LEFT
h4=scatter(-z0,x0,5,Col_2,'+');
hold on
h5=scatter(-z1,x1,8,Col_3,'.');
hold on
h6=scatter(-z2,x2,8,Col_3,'.');
%legend('','');
legend([h0(1),h1(1),h2(1),h3(1)],'Mesh','Pneumatic center', 'Air Entry', 'Air Outlet','location', 'northeast')
title('Swept wing meshing');
xlabel('Z');    ylabel('X');

%% Solve
for i=-4:10
    alpha=i*Rad;
    varGamma= airDynamic_CalVortex(x0,x1,x2,z0,z1,z2,Vinf(2),alpha,(sqrt(n)-1)^2);
    Cy(i+5)=airDynamic_CalLiftingForce(Vinf(2),RHO,dZ,S,varGamma);
end


