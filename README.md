# OpenCV and OpenCV Docker Container Images

## Intro
This container image contains compiled versions of OpenCV and OpenCV-Contrib. The image is based on the official ubuntu:18.04 base image. The steps that I have followed are mostly adopted from the following webpages.

https://www.pyimagesearch.com/2018/08/15/how-to-install-opencv-4-on-ubuntu/ 
https://www.pyimagesearch.com/2018/05/28/ubuntu-18-04-how-to-install-opencv/


## Version
* Ubuntu 18.04
* Python 3.6.9
* OpenCV 3.4.6
* OpenCV Contrib 3.4.6


## Note
1. Non-Free modules like SIFT and SURF are enabled. So, check on the license of the respective modules, if you need to use them for commercial uses
2. Other modules like `tesseract-ocr` have also been included for convenience
3. I have also added a few fixes to the issues that I ran into while building these images


More improvements to follow.

