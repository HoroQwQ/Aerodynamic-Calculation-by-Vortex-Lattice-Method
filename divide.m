%--------------------------------------------------------------------------
% divide.m
% 
% Purpose:
%   Partition finite element mesh.
%
% Last modified:   2023/10/4    by: Minghe Lee  
% 
%--------------------------------------------------------------------------
function [x_new,y_new] = divide(type)
%% read data
wing_Const;
%% define StableMartix
x1=0;y1=1;
x2=1;y2=1;
x3=1;y3=0;
x4=0;y4=0;
%% define Sweepwing
%{ 
A reference test
x1s=0;y1s=1.2;
x2s=3;y2s=0.8;
x3s=3;y3s=-0.1;
x4s=0;y4s=0;
%} 

if(type==0)
    [x1s,y1s,x2s,y2s,x3s,y3s,x4s,y4s]=axisCal_RectangularWing(lambda);
elseif(type==1)
    [x1s,y1s,x2s,y2s,x3s,y3s,x4s,y4s]=axisCal_SBW(sweepbackWing_angle,...
                                                  sweepbackWing_wide,...
                                                  sweepbackWing_centra,...
                                                  sweepbackWing_length );
    clear deltaWing_length deltaWing_wide;                                       
elseif(type==2)
    [x1s,y1s,x2s,y2s,x3s,y3s,x4s,y4s]=axisCal_DeltaWing(deltaWing_TrailingEdge);
end

%% initialize the mesh
[x,y]=meshgrid(linspace(0,1,sqrt(n)));
%% calculatte
% Martx A
matrix_A=[x1*y1, x1, y1, 1;
          x2*y2, x2, y2, 1;
          x3*y3, x3, y3, 1;
          x4*y4, x4, y4, 1];
matrix_B1=[x1s;x2s;x3s;x4s];
matrix_B2=[y1s;y2s;y3s;y4s];
clear x1s x2s x3s x4s y1s y2s y3s y4s;

% solve the linear equations
matrix_C1=matrix_A\matrix_B1;
matrix_C2=matrix_A\matrix_B2;

% Transfer function
x_new=matrix_C1(1).*x.*y+matrix_C1(2).*x+matrix_C1(3).*y+matrix_C1(4);
y_new=matrix_C2(1).*x.*y+matrix_C2(2).*x+matrix_C2(3).*y+matrix_C2(4);
clear x1 x2 x3 x4 y1 y2 y3 y4 x y;
clear matrix_A matrix_B1 matrix_B2 matrix_C1 matrix_C2;
end