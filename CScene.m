classdef CScene
    %CScene Summary of this class goes here
    %   Should describe scene well enough to make operations with robot
    %   hand
    
    properties
        MP = eye(4); %camera to world transform
        b_box = zeros(2,5); %edge points
        frame = zeros(10);
    end
    
    methods
        function obj = CScene(cal_img, scene_size, scene_ofs, cube_size) %image
            %SCcene Construct an instance of this class
            %   Detailed explanation goes here
            %obj.Property1 = inputArg1 + inputArg2;
            X=rgb2gray(imread(cal_img));
            imshow(X);
            obj.MP = rand(4);
            obj.b_box = zeros(2,4);
            
            %Analyse scene, see what are lines of board
            %Set camera callib matrix
            %Count cubes and learn shades, remember positions
        end
        
        function ret = dbg()
            
        end

        function ret = track(obj,inputArg)
            %track Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = obj.Property1 + inputArg;
        end
        
        function command
    end
end

