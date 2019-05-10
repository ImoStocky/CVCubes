function [T, Xnorm] = myNormalization(X)

[N,M] = size(X);
Xm = mean(X);
D = mean(sum(sqrt( (X-Xm).^2)));
    
U = diag(ones(M+1,1));
t = sqrt(M);
for i=1:M
    U(i,i)=t/D;
    U(i,end) = -t*Xm(i)/D;
end
XX = [X, ones(N,1)];
Xnorm = U*XX';

Xnorm = Xnorm(1:end-1,:);

T = U;
end