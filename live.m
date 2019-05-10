%Script for trying analysis

X = imread('data/cal_2.tiff');
imshow(X);
img=im2double(rgb2hsv(X));
Xg=img(:,:,3);
E = edge(Xg,'canny');
hold on;
alpha_data = (E == 1);
h = imshow(E);
hold off;
set(h, 'AlphaData', alpha_data);

pl = find_corners(Xg, 5, 1);
Th = quantile(pl(1,:),[0.80])
pl = find_corners(Xg, 5, Th);


hold on;
plot_point_list(pl);
hold off;

figure
st=strel('disk',20);
XX=imclose(Xg,st);
imshow(XX)
imshow(E)
XXX=XX-X;
XXX=XXX(:,:,3);
test=imgradient(XXX);
imshow(test);
L=watershed(test);
Lrgb = label2rgb(L);
imshow(Lrgb);

lines = ext_lines(E,10,100);
figure
imshow(Xg), hold on
plot_lines(lines);




