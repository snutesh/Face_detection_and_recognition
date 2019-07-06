function face_detection_in_image
%% Taking an image
clc;
% clear all;
close all;
[fname, path] = uigetfile('.jpg','');
fname = strcat(path,fname);
im = imread(fname);
 [x,y,z] = size(im);

%% Display of Input Image
 if(x>=500 && x<2000)
     im = imresize(im,0.5);
 end
 if(x>=2000)
     im = imresize(im,0.1);
 end
 imshow(im);
 title('Input Face');

%% Face Detection
detector = vision.CascadeObjectDetector();
detector.MergeThreshold = 10;
bbox = step(detector,im);
 out = insertObjectAnnotation(im, 'rectangle',bbox,'');
 imshow(out)

%% Seperation of faces 
for i = 1 : size(bbox, 1) 
  J = imcrop(im, bbox(i, :)); 
   figure(3);
   subplot(6, 6, i);
   imshow(J);
  s = strcat('testing\',int2str(i),'.jpg');
  imwrite(J,s);
end

%% Recognition of Faces
%Face_Classifier(bbox);