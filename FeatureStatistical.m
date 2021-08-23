%save this as a function, which will be further used in our program. Name of which will of course be FeatureStatistical same as what we wrote below
function [F] = FeatureStatistical(im)
% converting the image to double to perform mathematical tasks easily with higher precision
im = double(im);
% separating the RGB image into 3 channels
red = im(:,:,1);
% replacing the other two channels with zeros which  means zero intensity of other two colours
red(:,:,2:3) = 0;
green = im(:,:,2);
green(:,:,2:3) = 0;
blue = im(:,:,3);
blue(:,:,2:3) = 0;
% converting each colour to grayscale. rgb2gray takes only three dimensional Matrix as input so we have made the one  dimensional colour to three dimensional above, which is now given input here
red = rgb2gray(double(red));
green = rgb2gray(double(green));
blue = rgb2gray(double(blue));
% giving each colour as input to the histmaxmean function which returns two values 1)  the intensity for which the INTENSITY versus NUMBER OF PIXELS histogram attends maximum 2) mean of the intensity of all the pixels
[maxpointr, meanr] = histmaxmean(red);
[maxpointg, meang] = histmaxmean(green);
[maxpointb, meanb] = histmaxmean(blue);
% this calculate the standard deviation of the intensities of the pixels. As the image is a two dimensional Matrix so we had to calculate standard deviation twice. As the value of standard deviation is small we have to multiply by 100
sr = std(std(red(:,:,1)))*100;
sg = std(std(green(:,:,1)))*100;
sb = std(std(blue(:,:,1)))*100;
% mean and standard deviation are two of the most important characteristics of an image so these two are used in this program along with "maxpoint"   to make the program more accurate
% a vector with all the features of the image is created below (f)
F = [maxpointr maxpointg maxpointb meanr meang meanb sr sg sb];
end

