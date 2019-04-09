# CVCubes
Computer vision course practical assignment. Moving the cubes using robot hand and camera.

# Main idea of solution
Using classes keep state of object in scenes, use previous knowledge to better approximate next positions
Scene holds information about board, camera calibration matrix, cube positions and enables exectuion of 
commands.

Skeletion function is written in main. Idea is to analyse successive frames, track cube positions