% Reading input image
I = imread("Downloads\landscape.jpg");

% Converting image into grayscale
gray_pic = im2gray(I);

% Using inbuilt MATLAB function for Robert's edge detector
edges_roberts = edge(gray_pic,"roberts");

% Output image
imshow(edges_sobel)
title("Output (Robert's Operator)")