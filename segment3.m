function cubes = segment3(cal_img)
% Function segments the board from image and sellects 
if ~exist('cal_img','var')
    X = imread('data/cal_2.tiff');
else
    X = imread(cal_img);
end

figure;
hold on;
[~, BW_c, poly] = segment_board(X);

BW=imopen(BW_c,strel('disk',25));

cubes = regionprops('table', BW, 'area','centroid');
fc = cubes.Area > 4500 & cubes.Area < 15000; %%< Limits for size of cubes
% For easy filtering of only cubes
% Delete out of polygon blobs
cubes=cubes(fc,:);
valid=inpolygon(cubes.Centroid(:,1),cubes.Centroid(:,2),poly(:,1),poly(:,2));
cubes=cubes(valid,:);

hold on;
plot_point_list(cubes.Centroid(:,[2,1])');

%cubes=cubes_corners;%number of cubes, [x,y,z hited] coords
cubes=[[1:4]',cubes.Centroid([1:4],:),[25,25,25,25]'];
%After transformation average out to get center

end
