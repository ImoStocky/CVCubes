clc
clear all

%%%%%   This part for calculation of center/corners of the cubes if you
%%%%%   know oly one of them.

% test_image_1.tiff
% redm = [457, 93, 25];
% greenm = [405, -206, 25];
% bluem = [657, 44, 25];
% blackm = [607, -155, 25];

% test_image_2.tiff
redm =   [457, -155, 25];
greenm = [658,    5, 25];
bluem =  [607, -207, 25];
blackm = [407,   45, 25];

cube_size = 50;

% find all the coordinates from coords of center
red = full_from_center(redm, cube_size);
green = full_from_center(greenm, cube_size);
blue = full_from_center(bluem, cube_size);
black = full_from_center(blackm, cube_size);

% find coordinates of cube center from coords of corners
redc = center_from_full(red);
greenc = center_from_full(green);
bluec = center_from_full(blue);
blackc = center_from_full(black);

% hold on;
% plot3(red(1,:),red(2,:),red(3,:), 'ro')
% plot3(green(1,:),green(2,:),green(3,:), 'go')
% plot3(blue(1,:),blue(2,:),blue(3,:), 'bo')
% plot3(black(1,:),black(2,:),black(3,:), 'ko')
% hold off

r = redc-redm;
g = greenc-greenm;
b = bluec-bluem;
k = blackc-blackm;