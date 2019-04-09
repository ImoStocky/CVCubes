function f = plot_point_list(P,color)
    if ~exist('color','var')
        color = 'r.';
    end
    
    x=3;
    y=2;
    
    if size(P,1)<3
        x=2;
        y=1;
    end
        
    f=plot(P(3,:),P(2,:),color);
end

    