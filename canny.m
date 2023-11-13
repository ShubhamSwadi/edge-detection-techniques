% Reading image
I = imread("Downloads\landscape.jpg");

% Converting image in grayscale
gray_pic = rgb2gray(I);

% Using inbuilt MATLAB function for Canny edge detection
edges_canny = edge(gray_pic,"Canny");

% Output image
imshow(edges_canny)
title("Output (Canny edge detector)")