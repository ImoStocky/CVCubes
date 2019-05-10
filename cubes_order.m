function [Xfirst, Xord] = cubes_order(X)
S = X(:,1)+X(:,2);
[~,I] = sort(S);
Xfirst = X(I(end),:);
I(end) = [];
Xord = X(I,:);
end