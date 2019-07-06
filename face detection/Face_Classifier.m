function Face_Classifier(bbox)
%% Test Face
for j = 1 : size(bbox, 1)
% [fname, path] = uigetfile('');
fname = strcat('testing\',int2str(j),'.jpg');
im = imread(fname);
imshow(im);
title('Test Face');

%% Face Classifier
Ftest = FeatureStatistical(im);
load db.mat
Ftrain = db(:,1:2);
Ctrain = db(:,3);
for(k=1:size(Ftrain-Ftest))
    dist(1,:) = sum(abs(Ftrain(1,:)-Ftest));
end
Min = min(dist);
if(Min<10)
    m = find(dist==min(dist),1);
    det_class = Ctrain(m);
    msgbox(strcat('detected class:',num2str(det_class)));
    str = strcat(int2str(j),'.jpg');
    file = fullfile('testing',str);
    delete(file);
else
    msgbox('this person is not registered');
    str = strcat(int2str(j),'.jpg');
    file = fullfile('testing',str);
    copyfile(file,"training");
    
end
end