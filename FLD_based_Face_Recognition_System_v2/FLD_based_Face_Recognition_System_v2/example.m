% FLD-based face recognition system (Fisherface method)
%
% See also: CREATEDATABASE, FISHERFACECORE, RECOGNITION

clear all
clc
close all

% You can customize and fix initial directory paths
TrainDatabasePath = '/home/kanv/Dip_project/FLD_based_Face_Recognition_System_v2/FLD_based_Face_Recognition_System_v2/TrainDatabase';
%TestDatabasePath = uigetdir(strcat(matlabroot,'\work'), 'Select test database path');
TestDatabasePath = '/home/kanv/Dip_project/FLD_based_Face_Recognition_System_v2/FLD_based_Face_Recognition_System_v2/TestDatabase';
prompt = {'Enter test image name (a number between 1 to 10):'};
dlg_title = 'Input of FLD-Based Face Recognition System';
num_lines= 1;
def = {'1'};

TestImage  = inputdlg(prompt,dlg_title,num_lines,def);
TestImage = strcat(TestDatabasePath,'/',char(TestImage),'.jpg');
%TestImage
im = imread(TestImage);

T = CreateDatabase(TrainDatabasePath);
[m V_PCA V_Fisher ProjectedImages_Fisher] = FisherfaceCore(T);
OutputName = Recognition(TestImage, m, V_PCA, V_Fisher, ProjectedImages_Fisher);

SelectedImage = strcat(TrainDatabasePath,'/',OutputName);
SelectedImage = imread(SelectedImage);

imshow(im)
title('Test Image');
figure,imshow(SelectedImage);
title('Equivalent Image');

str = strcat('Matched image is :  ',OutputName);
disp(str)
 