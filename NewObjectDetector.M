clear
nnet = alexnet;
system('python D:\NAO Python Scripts\Python27\Lib\site-packages\pynaoqi-python2.7-2.1.4.13-win32-vs2010\takePhoto.py')
%im = imread('path of cam image')
im = imresize(im,[227 227]);
label = classify(nnet,im);
image(im);
title(char(label));

%speakObject = ('python "path of python speakObject NAO Script", title)
