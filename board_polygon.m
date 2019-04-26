function poly=board_polygon(cal_pt)
    poly=cal_pt;
    m_pt=mean(cal_pt);
    score=(m_pt<cal_pt)*([2;1]);
    score=score+1;
    score([3,4],:)=score([4,3],:);
    poly=cal_pt((score),:);
end