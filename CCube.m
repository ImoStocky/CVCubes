classdef CCube
    %SCube Summary of this class goes here
    %   Class to keep track of cubes in scene
    %   It should make it easier to manipulate cubes, keep track of their
    %   identities etc...
    
    properties
        identity;
        x;
        y;
        z;
        b_box_x;
        b_box_y;
    end
    
    methods
        function obj = untitled8(inputArg1,inputArg2)
            %UNTITLED8 Construct an instance of this class
            %   Detailed explanation goes here
            obj.Property1 = inputArg1 + inputArg2;
        end
        
        function outputArg = method1(obj,inputArg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = obj.Property1 + inputArg;
        end
    end
end

