%% Load neural network
net = alexnet;
layers = net.Layers;

%%modify the network to use 22 categories
layers(23) = fullyConnectedLayer(22);
layers(25) = classificationLayer();


%% Set up training data
allImages = imageDatastore('Sorted_Faces' , 'IncludeSubfolders', true, 'LabelSOurce', 'foldernames');  %Change 'Sorted Faces' to name of your folder full of resized images
[trainingImages, testImages ] = splitEachLabel(allImages, 0.9, 'randomize');

%% re-train the network
opts = trainingOptions('sgdm' , 'InitialLearnRate', 0.001, 'MaxEpochs', 15, 'ExecutionEnvironment' , 'gpu');
new_Net = trainNetwork(trainingImages, layers, opts);

%%Calculate accuracy
predictedLabels = classify(new_Net, testImages);
accuracy = mean(predictedLabels == testImages.Labels);

