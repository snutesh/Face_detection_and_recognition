 %% Taking an image
 clc;
 clear all;
 close all;
 [fname, path] = uigetfile('.jpg','Open a face as input for training');
 fname = strcat(path,fname);
 im = imread(fname);
 imshow(im);
 title('Input Face');
 c = input('Enter the class:');
 
 %% Feature Extraction
 F = FeatureStatistical(im);
 try
     load db;
     F = [F,c];
     db = [db;F];
     save db.mat db
 catch
    db = [F,c]; % 10 12 1
    save db.mat db
 end