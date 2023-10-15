%--------------------------------------------------------------------------
% airDynamic_CalAxis.m
% 
% Purpose:
%   calculate x z x1 z1 x2 z2
%
% Last modified:   2023/10/4    by: Minghe Lee  
% 
%--------------------------------------------------------------------------

function [x0,z0,x1,z1,x2,z2]=airDynamic_CalAxis(x,z)
%% read data
    wing_Const;
    %z=x_new;x=y_new;
%% calculate the data

    for i=1:sqrt(n)-1
        for j=1:sqrt(n)-1
            x0(i,j)=(x(i+1,j)-x(i,j)+x(i+1,j+1)-...
                     x(i,j+1))/8+(x(i,j)+x(i,j+1))/2;
            z0(i,j)=(z(i,j+1)+z(i,j))/2;  
            x1(i,j)=x(i,j)+(x(i+1,j)-x(i,j))*0.75;
            z1(i,j)=z(i,j);
            x2(i,j)=x(i,j+1)+(x(i+1,j+1)-x(i,j+1))*0.75;
            z2(i,j)=z(i,j+1);
        end
    end
end
