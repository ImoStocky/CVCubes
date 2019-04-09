%Script for trying analysis

X = imread('data/TeamAlex_cal.tiff');
imshow(X);
img=im2double(rgb2hsv(X));
Xg=img(:,:,3);
E = edge(Xg,'canny',.3);
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
st=strel('disk',50);
XX=imclose(X,st);
XXX=XX-X;
XXX=XXX(:,:,3);
test=imgradient(XXX);
imshow(test);
L=watershed(test);
Lrgb = label2rgb(L);
imshow(Lrgb);


