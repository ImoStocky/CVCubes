function lines = ext_lines(BW, num, min_len)
[H,T,R] = hough(BW);
P  = houghpeaks(H,10,'threshold',ceil(0.3*max(H(:))));
x = T(P(:,2));
y = R(P(:,1));
lines = houghlines(BW,T,R,P,'FillGap',num,'MinLength',min_len);

end