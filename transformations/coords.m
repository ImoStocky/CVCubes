clc
clear all

XX = [632, 632,  582,  582,  380,  380, 432, 432];
YY = [ 69,  69, -130, -130, -181, -181, 118, 118];
ZZ = [  0,  50,    0,   50,    0,   50,   0,  50];
X = [XX' YY' ZZ'];

figure;
imshow(imread('test_image_1.tiff'));
[xx,yy, button] = ginput(8);
x = [xx,yy];

X2 = [633,   30,  0;
      633,   30, 50;
      582, -182,  0;
      582, -182, 50;
      432, -130,  0;
      432, -130, 50;
      382,   70,  0;
      382,   70, 50];
 figure;
 imshow(imread('test_image_2.tiff'));
 [xx2,yy2, button2] = ginput(8);
 x2 = [xx2,yy2];
 
 save calibration_coords.mat X x
 save test_coords.mat X2 x2