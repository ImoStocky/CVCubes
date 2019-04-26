function [polw,poly]=bbox_to_poly(bbox)
    %ofs=[-0.5,-0.5;0.5,-0.5;0.5,0.5;-0.5,0.5].*1.2;
    %ofs=ofs+(0.5*1.2);
    ofs=[0,0;1,0;1,1;0,1];
    ofs2=[-3,-3;+3,-3;+3,+3;-3,+3];

    ofs(:,1)=ofs(:,1).*bbox(3);
    ofs(:,2)=ofs(:,2).*bbox(4);
    poly=ofs;
    poly(:,1)=ofs(:,1)+bbox(1);
    poly(:,2)=ofs(:,2)+bbox(2);
    polw=poly+ofs2;
end