function [M, xnew] = calibration(X, x)

j = 1;
for i = 1:size(x,1)
    A (j, :) = [X(i,:) 1 0 0 0 0 -x(i,1).*X(i,:) -x(i,1)];
    A (j + 1, :) = [0 0 0 0 X(i,:) 1 -x(i,2).*X(i,:) -x(i,2)];
    j = j + 2;
end

[U, D, V]= svd(A);
u = V(:, end);
M = reshape(u, 4, 3)';

p3 = X';
p3 = [p3; ones(1, size(p3,2))];

xp = M * p3;
xnew = [xp(1,:)./xp(3,:); xp(2,:)./xp(3,:)];

end
