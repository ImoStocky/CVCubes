function [X,Y] = transform3D(x, M, Z)
 
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