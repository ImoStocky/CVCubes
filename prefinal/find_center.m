function Xcenter = find_center(X, cube_size)
Xc = sum(X(:,1))/2;
Yc = sum(X(:,2))/2;
Zc = cube_size/2;

Xcenter = [Xc; Yc; Zc];
end