function corners = find_corners(img, N, t)
%%FINDCORNERS
% corners = list of [\lambda_2;y;x] vectors
   
    dx = conv2(img,[-1,0,1],'same');
    dy = conv2(img,[-1,0,1]','same');
%     figure;
%      axis equal;
%      subplot(131);
%      imagesc(dx);     
%      subplot(132);
%      imagesc(dy);
%      subplot(133);
%      imagesc(dy.*dx);
    
    dx2=dx.*dx;
    dy2=dy.*dy;
    dxy=dx.*dy;
    
    %Smooth the transformed images a little
    A = conv2(dx2,ones(N),'same');
    B = conv2(dy2,ones(N),'same');
    C = conv2(dxy,ones(N),'same');
    
    %Corn = 0*A;
    %E1 = 0*A;
    E2 = 0*A;

    %Neighborhood indexes
    Q=floor(combvec([1:N]-N/2,(1:N)-N/2));
   
    ofs=floor(N/2);
    
    if N==1
        Q=[];
        ofs=0;
    end
    
    %List of indexes in image for simplicity, i know its too hungry for
    %resources
    i = combvec(1+ofs:size(A,1)-ofs,1+ofs:size(A,2)-ofs);
    L = [];
    for c=i
        M = [A(c(1),c(2)),C(c(1),c(2));C(c(1),c(2)),B(c(1),c(2))]; 
        E = eig(M);
        %E1(c(1),c(2))=E(1);
        if (sum(E>0)==2 && (E(2))>t)
            E2(c(1),c(2))=E(2);
            L = [L, [E(2);c]];
        end
    end
    %figure
    %E4=E2;
    %imagesc(E4);
    

    [~,inx]=sort(L(1,:),'desc');
    L = L(:,inx);
    for idx=1:length(L)
        e=L(:,idx);
        tmp=E2(e(2),e(3));
        if tmp>t
            %Set neighborhood to zero
            for didx=Q
                ofs=e(2:3)+didx;
                E2(ofs(1),ofs(2)) = 0;
            end
            %Keep maximum
            E2(e(2),e(3))=tmp;
        end
    end
    %figure
    %imagesc(E2);
    %figure
    %imagesc(E4-E2);

    %List pruning
    L = [];
    for c=i
        tmp = E2(c(1),c(2));
        if tmp>t
            L = [L, [tmp;c]];
        end
    end
    [~,inx]=sort(L(1,:),'desc');
    L = L(:,inx);

    corners=L;
end

%    kern=eye(N);
%    kern=kern.*kern(:,end:-1:1);
%    for c=i
%        L = [];
%        for didx=Q
%
%            %E = [E1(c(1),c(2));E2(c(1),c(2))];
%            ofs=c+didx;
%            e=E2(ofs(1),ofs(2)
%            if (e)
%                L = [L, [e;c]]
%            end
%        end
%        sort
%corn(c(1),c(2)) = e(2)/e(1);
