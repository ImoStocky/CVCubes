function [X,Y] = transform3D(x, M, Z)
 
 %don't need here
 v = zeros(2,1);
 for i=1:2
     v(i) = 0.5*( M(i,3)*(M(3,1)+M(3,2)+M(3,4)) - M(3,3)*(M(i,1)+M(i,2)+M(i,4)));
     v(i) = v(i)/((M(3,1)+M(3,2)+M(3,4))*(M(3,1)+M(3,2)+M(3,4)+0.5*M(3,3)));
 end
 %%%%   TODO
 %%%% Calculate Z by using v, x, M ?
 %%%% Z = {0, 0.5} but we should found wich point is 0 and wich is 0.5
 
  for i=1:length(Z)
      c1 = Z(i)*(M(1,3) - M(3,3)*x(i,1)) - (x(i,1)*M(3,4)-M(1,4));
      c2 = Z(i)*(M(2,3) - M(3,3)*x(i,2)) - (x(i,2)*M(3,4)-M(2,4));
      c = [c1; c2];
 
      a11 = M(3,1)*x(i,1)-M(1,1);
      a12 = M(3,2)*x(i,1)-M(1,2);
      a21 = M(3,1)*x(i,2)-M(2,1);
      a22 = M(3,2)*x(i,2)-M(2,2);
      A = [a11, a12; a21, a22];
      A = A';
      
      B(:,i) = c'/A;
  end
 X = B(1,:)';
 Y = B(2,:)'; 
end