function Xcenter = center_from_full(X)
% find coordinates of cube center from coords of corners
% in fact you don't need to keep all the corners, it would be enough to
% save "unique" coords for each direction

[n,~] = size(X);
for i=1:n
    Xcenter(i) = sum(unique(X(i,:)))/2;
end