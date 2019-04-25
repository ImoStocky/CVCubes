clc
clear all

X=[0 0 0; 0 0 0.05; 0 0.05 0; 0 0.05 0.05; ...
    -0.05 0 0; -0.05 0 0.05; -0.05 0.05 0; -0.05 0.05 0.05];

x=[160 400; 152 408; 198 330; 192 335; ...
    90 362; 78 368; 128 291; 118 294];

[M, xnew] = calibration(X, x);

Z = X(:,3);
[X1,Y1] = transform3D(x, M, Z);

%x = x';
figure;
hold on
plot (x(:,1), x(:,2), 'rx')
plot(xnew(1,:), xnew(2,:), 'bo')
hold off

figure;
hold on
plot3(X(:,1),X(:,2),X(:,3), 'b*')
plot3(X1,Y1,Z, 'ro')
hold off