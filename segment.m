function [board_poly, cubes] = segment(cal_img)

if ~exist('cal_img','var')
    X = imread('data/cal_2.tiff');
else
    X = imread(cal_img);
end
imshow(X)
img=im2double(rgb2hsv(X));
Xg=img(:,:,3);
E = edge(Xg,'canny',0.2);
hold on;
alpha_data = (E == 1);
h = imshow(E);
set(h, 'AlphaData', alpha_data);

% Detect board
[H,T,R] = hough(E);
P = houghpeaks(H,4,'threshold',ceil(0.3*max(H(:))));
lines = houghlines(E,T,R,P,'FillGap',15,'MinLength',250);
for k = 1:length(lines)
 xy = [lines(k).point1; lines(k).point2];
 plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

 % plot beginnings and ends of lines
 plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
 plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
 % determine the endpoints of the longest line segment 
 len = norm(lines(k).point1 - lines(k).point2);
end

% Find corners
[cal_pt, cal_e]=intersections(lines, size(Xg));
plot_point_list(cal_pt', 'go');

% Make corners into polygon
poly=board_polygon(cal_pt);
%inpolygon(1,1,poly(:,2),poly(:,1));
board_poly=poly;

% Tomasi kanade edge detector
pl = find_corners(Xg, 5, 1);
Th = quantile(pl(1,:),[0.80])
pl = find_corners(Xg, 5, Th);

% Segment out the cubes
figure
R=imbinarize(X(:,:,1));
G=imbinarize(X(:,:,2));
B=imbinarize(X(:,:,3));
BW=~(R&G&B);
imshow(BW)
 
cubes = regionprops('table', BW, 'centroid', 'area','boundingbox');
fc = cubes.Area > 4500 & cubes.Area < 18000; %%< Limits for size of cubes
% For easy filtering of only cubes
cubes=table2struct(cubes);
cubes=cubes(fc);
cubes=struct2table(cubes);

valid=inpolygon(cubes.Centroid(:,1),cubes.Centroid(:,2),poly(:,2),poly(:,1));
% Delete out of polygon blobs
cubes=cubes.Centroid(valid,:);
plot_point_list(cubes.Centroid(:,[2,1])');

% Just to print
for k = 1 : height(cubes)
  thisBB = cubes.BoundingBox(k,:);
  rectangle('Position', [thisBB(1),thisBB(2),thisBB(3),thisBB(4)],...
  'EdgeColor','r','LineWidth',2 )
end

% One cube processing
[redPoly,red]=bbox_to_poly(cubes.BoundingBox(2,:));
fcb = @(p) find_corners(Xg(p(1,2):p(3,2),p(1,1):p(3,1)), 3, 1);
pl = fcb(redPoly);
% Offset subimage coords
pl(2,:)=pl(2,:)+redPoly(1,2);
pl(3,:)=pl(3,:)+redPoly(1,1);

figure;
imshow(Xg);
hold on;
% Filter out corners from edges of subimages
subs=inpolygon(pl(3,:)',pl(2,:)',red(:,1),red(:,2));
pl=pl(:,subs);
plot_point_list(pl(:,subs),'r.');

Th = quantile(pl(1,:),[0.95]);
subs = find(pl(1,:)>Th);
plot_point_list(pl(:,subs),'b.');


plot_point_list(redPoly(subs,[2,1])','go')
figure;
histogram(pl(1,:)>3.5)


