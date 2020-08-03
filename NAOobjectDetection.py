close all;
proceed = 0;
classes = dir('Lab_objects');
featureLayer = 'fc7';
classObjectsAlex = zeros(1,length(classes)-2);
classLabObjectsVGG = zeros(1,length(classes)-2);
minimumDifferencesAlex = zeros(1,length(classes)-2);

system('python D:\NAO Python Scripts\Python27\Lib\site-packages\pynaoqi-python2.7-2.1.4.13-win32-vs2010\ObjectRecognition.py')
image = imread('D:\Abhir NAO Folder\camImage.png');
bbox = objectDetector(image)
if size(bbox,1) >1
    [M,Index] = max(bbox(:,3));
    bbox = bbox(Index,:);
    image = imcrop(image,bbox);
else
    image = imcrop(image,bbox);
end
imageAlex = imresize(image, [227,227]);

figure
imshow(imageAlex)

featImageAlex = activations(net32, imageAlex, featureLayer);


tic
for i = 3:length(classes)
    classLabObjectAlex(i-2) = norm(featImageAlex - allLabFaceFeatures2(i-2,:)
end
toc


for i = 1:length(classes)-2
    minimumDifferencesAlex(i) = sort(abs(min(classLabObjectAlex)- classLabObjectAlex(i)));
end

minimumDifferencesAlex = mean(minimumDifferencesAlex(2:end))


figure
scatter(1:length(classes)-2,classLabObjectAlex)
xlabel('Database Index')
ylabel('feature distance of Image Vs Objects in the dataset')
title('retrained Alexnet')

[M,I] = min(classLabObjectAlex);
minimumDistanceAlex = abs(min(classLabObjectAlex) - min(classLabObjectAlex(classLabObjectAlex~=min(classLabObjectAlex))));


if (minimumDistanceAlex <0.2*mean(classLabObjectAlex))
    system('python D:\NAO Python Scripts\Python27\Lib\site-packages\pynaoqi-python2.7-2.1.4.13-win32-vs2010\speakObject.py')
    Make_Image_Folder_ForObject
    lab_Object_Features
    %system(strcat('python  
    %i need to write a confirmation script in python for this.
