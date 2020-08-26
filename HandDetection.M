clear variables;
close all;
clc 

camera = webcam;
img = imread camera.snapshot;
height = size(img,1); %The image of the hand has to rescaled to one unit scale for the 
width = size(img,1);

img=imread(fullFileName);
    img=rgb2ycbcr(img);
    for i=1:size(img,1)
        for j= 1:size(img,2)
            cb = img(i,j,2);
            cr = img(i,j,3);
            if(~(cr > 132 && cr < 173 && cb > 76 && cb < 126))
                img(i,j,1)=235;
                img(i,j,2)=128;
                img(i,j,3)=128;
            end
        end
    end
    img=ycbcr2rgb(img);
    subplot(2,2,1);
    image1=imshow(img);
    axis on;
    title('Skin Segmentation', 'FontSize', fontSize);
    set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);

    
    grayImage = rbg2gray(img);
    subplot(2,2,1);
    image1 = imshow(img) %shows the object after it has been gray-scaled
