clc
clear all

% load 3d and 2D coords from file for calibration
load('calibration_coords.mat')
%load('im1_coords.mat')

[M, ~] = calibration(X,x);

% load 3d and 2D coords from file for testing
load('test_coords.mat')
%load('im2_coords.mat')


%%%%%% TODO
%%%%%% Change order with order from segmentation
for i=1:size(x2,1)
    if(mod(i,2))
        Z(i) = 0;
    else
        Z(i) = 50;
    end
    if(i>8)
        Z(i) = 50;
    end
end

[X1, Y1] = transform3D(x2, M, Z);

for i=1:2:8
    XforC(i,:) = [(X1(i)+X1(i+1))/2, (Y1(i)+Y1(i+1))/2, Z(i)];
    %XforC(i,:) = [X1(i), Y1(i), Z(i)];
end
j=2;
for i=9:size(X1,1)
    XforC(j,:) = [X1(i), Y1(i), Z(i)];
    j=j+2;
end

j=1;
for i=1:2:size(XforC,1)
    X1center(j,:) = find_center(XforC(i:i+1,:),50);
    j=j+1;
end

hold on
plot3(X2(:,1), X2(:,2), X2(:,3), 'ro')
plot3(X1, Y1, Z, 'b*')
plot3(X2center(:,1), X2center(:,2), X2center(:,3), 'ro')
plot3(X1center(:,1), X1center(:,2), X1center(:,3), 'b*')
hold off

[Xbase, Xorder] = cubes_order(X1center);
f = hand_controller(Xbase, Xorder);
if (f)
    fprintf('\nwell done!\n');
else
    fprintf('\nsomething is wrong\n');
end