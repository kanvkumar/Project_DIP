%PCA
clear all
clc
close all

%paths fiXuing in a


TrainDatabasePath = 'TrainDatabase';
TestDatabasePath = 'TestDatabase';
%it gives a prompt
%the prompt is to test the image input



prompt = {'Enter test image name (a number between 1 to 10):'};
dlg_title = 'Input of PCA-Based Face Recognition System';
num_lines= 1;
def = {'1'};


%it takes test image from database
TestImage  = inputdlg(prompt,dlg_title,num_lines,def);
%input is stored in this from taken from database
TestImage = strcat(TestDatabasePath,'/',char(TestImage),'.jpg');

%scan image
im = imread(TestImage);

%creates database for output
T = CreateDatabase(TrainDatabasePath);
[m, A, Eigenfaces] = EigenfaceCore(T);
OutputName = Recognition(TestImage, m, A, Eigenfaces);


%training image is stored in this form
SelectedImage = strcat(TrainDatabasePath,'/',OutputName);
SelectedImage = imread(SelectedImage);

%executing output after performing several tests performed
imshow(im)
title('Test Image');
figure,imshow(SelectedImage);
title('Equivalent Image');


%it displays the output image titile in the command window
str = strcat('Matched image is :  ',OutputName);
disp(str)
