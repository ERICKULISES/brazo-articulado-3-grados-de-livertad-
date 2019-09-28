%ERICK ULISES ESTEVEZ MORAN
close all
clc
clear
grid on

printAxis();

promt = 'Introduzca el valor (grados) de la Primera Articulacion:';
theta1_deg = input(promt); %Indicar los grados al que lo vamos a dirigir
theta1_rad = deg2rad(theta1_deg); %indica la convercion de grados a radianes 
promt = 'Introduzca el valor (grados) de la Segunda Articulacion:';
theta2_deg = input(promt);%Indicar los grados al que lo vamos a dirigir
theta2_rad = deg2rad(theta2_deg); 
promt = 'Introduzca el valor (grados) de la Tercera Articulacion:';
theta3_deg = input(promt); %Indicar los grados al que lo vamos a dirigir
theta3_rad = deg2rad(theta3_deg); 

p1=[0;0;0];
l1 = 4;
l2 = 4;
l3 = 4;
for theta1_rad=0:0.4:theta1_rad
    clf  
% se crea la primera extremidad del brazo 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    TRz1 = [cos(theta1_rad) -sin(theta1_rad) 0 0; sin(theta1_rad) cos(theta1_rad) 0 0; 0 0 1 0; 0 0 0 1];
    TTx1 = [1 0 0 l1; 0 1 0 0; 0 0 1 0; 0 0 0 1];
    T1 = TRz1*TTx1;
    p2 = T1(1:3,4);

    v1x = TRz1(1:3,1);
    v1y = TRz1(1:3,2);

    v2x = p2+T1(1:3,1);
    v2y = p2+T1(1:3,2);

    line([p1(1) p2(1)], [p1(2) p2(2)], [p1(2) p2(2)],'color',[0 0 0],'linewidth',3);

    line([p1(1) v1x(1)], [p1(2) v1x(2)], [p1(2) v1x(2)],'color',[1 0 0],'linewidth',3);
    line([p1(1) v1y(1)], [p1(2) v1y(2)], [p1(2) v1y(2)],'color',[0 1 0],'linewidth',3);

    line([p2(1) v2x(1)], [p2(2) v2x(2)], [p2(2) v2x(2)],'color',[1 0 0],'linewidth',3);
    line([p2(1) v2y(1)], [p2(2) v2y(2)], [p2(2) v2y(2)],'color',[0 1 0],'linewidth',3);
    pause(0.4);
end

for theta2_rad=0:0.4:theta2_rad
    clf  
 %se crea la segunda estremidad del brazo     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    TRz2 = [cos(theta2_rad) -sin(theta2_rad) 0 0; sin(theta2_rad) cos(theta2_rad) 0 0; 0 0 1 0; 0 0 0 1];
    TTx2 = [1 0 0 l2; 0 1 0 0; 0 0 1 0; 0 0 0 1];
    T2 = TRz2*TTx2;

    Tf = T1*T2;
    p3 = Tf(1:3,4);

    v3x = p3+Tf(1:3,1);
    v3y = p3+Tf(1:3,2);

    line([p2(1) p3(1)], [p2(2) p3(2)], [p2(2) p3(2)],'color',[1 0 1],'linewidth',3);
    line([p3(1) v3x(1)], [p3(2) v3x(2)], [p3(2) v3x(2)],'color',[1 0 0],'linewidth',3);
    line([p3(1) v3y(1)], [p3(2) v3y(2)], [p3(2) v3y(2)],'color',[0 1 0],'linewidth',3);
    pause(0.4);
end

for theta3_rad =0:0.4:theta3_rad
    clf  
   % se crea la tercera extremidad del brazo  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    TRz3 = [cos(theta3_rad) -sin(theta3_rad) 0 0; sin(theta3_rad) cos(theta3_rad) 0 0; 0 0 1 0; 0 0 0 1];
    TTx3 = [1 0 0 l3; 0 1 0 0; 0 0 1 0; 0 0 0 1];
    T3 = TRz3*TTx3;

    Tf = T1*T2*T3;
    p4 = Tf(1:3,4);

    v4x = p4+Tf(1:3,1);
    v4y = p4+Tf(1:3,2);

    line([p3(1) p4(1)], [p3(2) p4(2)], [p3(2) p4(2)],'color',[0 0 0],'linewidth',3);
    line([p4(1) v4x(1)], [p4(2) v4x(2)], [p4(2) v4x(2)],'color',[1 0 0],'linewidth',3);
    line([p4(1) v4y(1)], [p4(2) v4y(2)], [p4(2) v4y(2)],'color',[0 1 1],'linewidth',3);
 pause(0.4);
end