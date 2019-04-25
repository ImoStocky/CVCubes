clc
clear all

% load 3d and 2D coords from file for calibration
load('calibration_coords.mat')

[M, ~] = calibration(X,x);

% load 3d and 2D coords from file for testing
load('test_coords.mat')

 %%%%   TODO
 %%%% Calculate Z by using v, x, M ?
 %%%% Z = {0; 0.5} but we should found wich point is 0 and wich is 0.5

[X1, Y1] = transform3D(x2, M, ZZ')

%%%%% TODO
%%%%% This part should be replaced by robot-controller function

% load 3d and 2D coords from file for calibration
hold on
plot3(X2(:,1), X2(:,2), X2(:,3), 'ro')
plot3(X1, Y1, ZZ, 'b*')
hold off
