%Main program scenario
scene = CScene('data\cal_2.tiff', [62.5,60],[-12,21], 5);
scene.dbg();

scene.target('encode final configuration')

x=0;
while 1
    x=x+1;
    frame=camera.get_next_frame(); %blocking call - wait for next frame
    scene.track(frame); %...
    
    if(input) %see if command was issues and logged
        scene.command('... necessary to describe operation') %execute command
    end
    
    if(scene.finished()) %see if command wad done
        scene.dbg();
        break;
    end
end


%% get video feed 
%process in loop frames
    %get optical flow - low res
    %get patches involved
    %identify cubes
    %recalculate positions

%inject move commands
    %track end of command
