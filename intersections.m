function [points, edges] = intersections(lines, size)
%Get line intersestions within image
points=[];
edges=[];
for l1=1:length(lines)
    delta = @(l) (l.point2(2)-l.point1(2))/(l.point2(1)-l.point1(1));
    par_line = @(l) [1, -delta(l),(-delta(l))*l.point1(1)+l.point1(2)];
    row1 = par_line(lines(l1));

    for l2=l1+1:length(lines)
        row2 =  par_line(lines(l2));
        % Ax=b
        % x=inv(A)*b
        A=[row1(1:end-1);row2(1:end-1)];
        b=[row1(end);row2(end)];
        pt = A\b; %[y;x]
        if prod(pt' > [0,0]) > 0 && prod(pt' < size) > 0
            points=[points;pt'];
            edges=[points;[l1,l2]];
        end
    end
end