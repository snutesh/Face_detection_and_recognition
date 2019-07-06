%% Test Face
clc;
clear all;
close all;
[fname, path] = uigetfile('.jpg','Open a face to test');
fname = strcat(path,fname);
im = imread(fname);
imshow(im);
title('Test Face');

%% Face Classifier
Ftest = FeatureStatistical(im);
load db.mat
Ftrain = db(:,1:2);
Ctrain = db(:,3);
for(i=1:size(Ftrain-Ftest))
    dist(1,:) = sum(abs(Ftrain(1,:)-Ftest));
end
Min = min(dist);
if(Min<3)
    m = find(dist==min(dist),1);
    det_class = Ctrain(m);
    msgbox(strcat('detected class:',num2str(det_class)));
else
    msgbox('this person is not registered');
end
