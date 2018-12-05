from naoqi import ALProxy
from PIL import Image
import random
import time
import os
import sys
import numpy
import cv2
import vision_definitions

ip = "169.254.253.219"
port = 9559

try:
    postureProxy = ALProxy("ALRobotPosture", ip, port)
    motionProxy = ALProxy("ALMotion", ip, port)
    spedchProxy = ALProxy("ALTextToSpeech", ip, port)
    anspeechProxy = ALProxy("ALAnimatedSpeech", ip, port)
    sprecogProxy = ALProxy("ALSpeechRecognition", ip, port)
    memoryProxy = ALProxy("ALMemory", ip, port)
    photoCaptureProxy = ALProxy("ALPhotoCapture", ip, port)
except Exception, error:
    print("Connection error: ", error)

resolution = vision_definitions.kQVGA
colorSpace = vision_definitions.kYUVColorSpace
fps = 30

sprecogProxy.setLanguage("English")

yesno = ["yes","no"]

def sprecog(vocab_list):
    sprecogProxy.setVocabulary(vocab_list, False)
    sprecogProxy.subscribe("ObjectRecognition")
    response = ['', -3.0]
    while response == ['', -3.0]
        time.sleep(1)
        global response
        response = memoryPRoxy.getData
        print(response)
    sprecogProxy.unsubscribe("ObjectRecognition")


speechProxy.say("This object is a " + sys.argv[1])
    
