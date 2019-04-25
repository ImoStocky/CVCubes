function Xfull = full_from_center(X, csize)
% find all the corner coordinates of the cube from coords of center and
% size of the cube

l = 1;
for i=1:2
    for j=1:2
        for k=1:2
            Xfull(1, l)= X(1) + csize/2*(-1)^i;
            Xfull(2, l)= X(2) + csize/2*(-1)^j;
            Xfull(3, l)= X(3) + csize/2*(-1)^k;
            l = l+1;
        end
    end
end
            