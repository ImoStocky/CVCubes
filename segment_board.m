function [poly_crop,BW_crop,hull] = segment_board(cal_img)
% Select convex hull of biggest white segment, with attempt to erode away
% robotic hand base
% The base is wrapped in polygon cubes are white in BW_corp and items
% beyond polygon are white too, this is to avoid making small white blobs

%X = imread(cal_img);
X = cal_img;
X = im2double(X);
V = rgb2hsv(X);
%X = rgb2gray(X);

R=imbinarize(X(:,:,1));
G=imbinarize(X(:,:,2));
B=imbinarize(X(:,:,3));
%V=imbinarize(V(:,:,3));
BW=~(R&G&B); %Cubes are white
% imshow(~BW);
%BW=imbinarize(V(:,:,3));

se=strel('diamond',20);
BW2=imclose(BW,se);
% A=graythresh(~BW2.*V(:,:,3));

% B=V(:,:,3);
% figure;
% histogram(B)
% C=reshape(B,[1,size(B,1)*size(B,2)]);
% D=quantile(C,[.70]);
% BW2=(V(:,:,3))>D;

% Board is white
board = regionprops('table', ~BW2, 'centroid', 'area','boundingbox','convexhull');
[~,idx] = max(board.Area,[],1);
hull=board.ConvexHull{idx};
prep=X;
prep(:,:,1)=X(:,:,1).*poly2mask(hull(:,1),hull(:,2),size(X,1),size(X,2));
prep(:,:,2)=X(:,:,2).*poly2mask(hull(:,1),hull(:,2),size(X,1),size(X,2));
prep(:,:,3)=X(:,:,3).*poly2mask(hull(:,1),hull(:,2),size(X,1),size(X,2));

BW_crop=~boolean(~boolean(BW).*poly2mask(hull(:,1),hull(:,2),size(X,1),size(X,2)));

imshow(prep);
E = edge(rgb2gray(prep),'canny',0.3);
hold on;
alpha_data = (E == 1);
h = imshow(E);
set(h, 'AlphaData', alpha_data);

poly_crop=prep;

end
