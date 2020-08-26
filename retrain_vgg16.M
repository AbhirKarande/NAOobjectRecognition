neuralNet = vgg16;
layers = neuralNet.Layers

layers(39) = fullyConnectedLayer(10575);
layers(41) = classificationLayer();

%% Set up training data
allImages = imageDatastore('CASIA224x224' , 'IncludeSubfolders', true, 'LabelSOurce', 'foldernames');  %Change 'Sorted Faces' to name of your folder full of resized images
[trainingImages, testImages ] = splitEachLabel(allImages, 0.9, 'randomize');
%save('testedImages',testImages);
%% re-train the network
opts = trainingOptions('sgdm' , 'InitialLearnRate', 0.001, 'MaxEpochs', 32, 'ExecutionEnvironment' , 'cpu' );
new_Net2 = trainNetwork(trainingImages, layers, opts);

%%Calculate accuracy
predictedLabels = classify(new_Net2, testImages);
accuracy = mean(predictedLabels == testImages.Labels);
