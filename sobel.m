% Sobel Operator

% Vertical edges
I1=double(rgb2gray((imread('landscape.jpg')))); 
In=I1;        
vmask=[1, 0, -1;2, 0, -2;1, 0, -1]; 
  
% Rotate mask by 180 degree first flip up to down then left to right 
vmask=flipud(vmask);  
vmask=fliplr(vmask); 

for i=2:size(I1, 1)-1
    for j=2:size(I1, 2)-1
  
        % Multiplying mask value with the corresponding image pixel value 
        neighbour_matrix=vmask.*In(i-1:i+1, j-1:j+1);  
        avg_value=sum(neighbour_matrix(:)); 
        I1(i, j)=avg_value; 
    end 
end 
figure
imshow(uint8(I1));


% Horizontal edges
I2=double(rgb2gray((imread('landscape.jpg')))); 
  
In=I2; 
hmask=[1, 2, 1;0, 0, 0;-1, -2, -1]; 
hmask=flipud(hmask); 
hmask=fliplr(hmask); 
for i=2:size(I2, 1)-1
    for j=2:size(I2, 2)-1
        neighbour_matrix=hmask.*In(i-1:i+1, j-1:j+1); 
        avg_value=sum(neighbour_matrix(:)); 
        I2(i, j)=avg_value; 
    end 
end 
figure
imshow(uint8(I2));

% Initializing an array with the same size of the image
I = zeros(size(I1));

% Setting threshold value
threshold = 230;

% Combined edges
for i=1:size(I1, 1)
    for j=1:size(I1, 2)
        I(i,j) = sqrt(I1(i,j)*I1(i,j) + I2(i,j)*I2(i,j));
        if I(i,j) < threshold
            I(i,j) = 0;
        end
    end
end
figure;
imshow(uint8(I));

I3 = rgb2gray((imread('landscape.jpg')));
edges_prewitt = edge(I3,"Prewitt");
figure;
imshow(edges_prewitt)
title('Final output (Sobel Operator)')
