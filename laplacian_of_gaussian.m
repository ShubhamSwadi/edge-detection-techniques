clc
close all

% Reading image
x=imread('landscape.jpg');
figure;
imshow(x);
title('Input Image');

% Converting image into grayscale
x = rgb2gray(x);

% Creating laplacian filter
h=fspecial('laplacian');
filtered_image=imfilter(x,h);
figure;
imshow(filtered_image);
title('Output of laplacian filter')

% Creating LoG filter
h=fspecial('log');
filtered_image=imfilter(x,h);
figure;
imshow(filtered_image);
title('Output of LoG filter')
