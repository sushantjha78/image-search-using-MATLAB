%this code will take pictures as input and calculate the different features of the image and test it with other images that have been loaded earlier into the database
[name, path] = uigetfile('.jpg','open a query image to search');
filename = strcat(path,name);
im = imread(filename);
imshow(im);
title('search image');
F = FeatureStatistical(im);
load db.mat
load store.mat
% above part is already explained in part 1
%db is a two dimensional database that has features of one image in one row. the loop below runs as many times as the number of rows in db(ie.  number of images)
%1  here indicates the  first dimension . size function here returns the size of first dimension of db
for (i = 1:size(db,1))
% features of query image is compared (subtracted) with features of database image  and the value with each image is stored in each column of dist (ie. Distance).  the order of "dist" remains same as the order of "db" and "Store"
dist(i) = sum(abs(double(db(i,:))-F));
%dist  obtained is a row matrix 
end
% dist gives information about how close the other image is to the query image.  we can set a threshold (here 1) to dist to obtain the top results
% find returns the index of the the values in dist which satisfy the given threshold
topresults = find(dist < 1);
% size of top results is returned by the size function. 1 here indicates the dimension whose size we want to calculate
for (i = 1:size(topresults,1))
% replace those indices back in dist, this returns a value. now find function finds  the index ,which satisfies the expression in find function  and returns it to result
% as the order of dist was same as the order of Store hence  the index  obtained from dist when placed in store returns the same image whose values where in that place
result = find(dist == dist(1,topresults(i)));
% shows the result image
figure;
subplot(3,3,i),imshow(store(:,:,:,result));
end

