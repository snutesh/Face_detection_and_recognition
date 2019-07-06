function [F] = FeatureStatistical(im)
im = double(im);
m = mean(mean(mean(im)));
s = std(std(std(im)));
F = [m,s];