% this function returns the point at which,1) the intensity versus number of pixels histogram reaches maximum and 2) the mean of the intensities is of all the pixels
function [maxpoint, mymean] = histmaxmean(im)
im = double(im);
% rescaling all the values in the image matrix  to values between 0 and 64 to get mean whose value is comparable (not too high) to the values of standard deviation and and maxpoint
im = rescale(im,0,64);
% calculating mean of the intensities of all the pixels
%im(:)  this converts two dimensional image to only one dimensional
mymean = mean(im(:));
% the maxima of histogram is nothing but the most repeated value of intensity
% we have used the property of histogram without making an actual histogram. Mode  calculates the most repeated value of intensity.  we have multiplied it by 10 to make it the largest quantity in features which we are comparing, because "maxpoint"  of query image should definitely match with result
maxpoint = mode(im(:)*10);
F = [maxpoint mymean];
end
