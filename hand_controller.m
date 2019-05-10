function f = hand_controller(base_coords, Xcoords)
Z_up = 300;
Z_step = 51;

X = Xcoords(:,1);
Y = Xcoords(:,2);
Z = Xcoords(:,3);
Xbase = base_coords(1);
Ybase = base_coords(2);
Zbase = base_coords(3)+Z_step;

gripOpen = 'CMD_GRIP_OPEN';
gripClose = 'CMD_GRIP_CLOSE';
moveTo = 'CMD_MOVETO';
grabImage = 'CMD_GRAB_IMAGE';
stopRobot = 'CMD_STOP';

% grab an image
aaz = RV3SB_client(grabImage);
imagesc(aaz); axis image; drawnow;
RV3SB_client(gripOpen);
Pbase_up = [Xbase, Ybase, Z_up];

for i=1:3
    %initial position
    Pbase = [Xbase, Ybase, Zbase];
    %Pbase_up = [Xbase, Ybase, Z_up];
    RV3SB_client(moveTo, Pbase_up );
    %move to block
    P_up = [X(i), Y(i), Z_up];
    RV3SB_client(moveTo, P_up );
    
    P = [X(i), Y(i), Z(i)];
    RV3SB_client(moveTo, P );
    RV3SB_client(gripClose);
    
    RV3SB_client(moveTo, P_up );
    %move to base block
    RV3SB_client(moveTo, Pbase_up );
    RV3SB_client(moveTo, Pbase );
    RV3SB_client(gripOpen);
    Zbase = Zbase+Z_step;
end

% move to P
%P = [ 405 -210 150 180 0 163];
% stop the robot
RV3SB_client(stopRobot);
f = 1;
end