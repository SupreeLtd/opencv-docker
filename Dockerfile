FROM ubuntu:18.04
LABEL author="Sri Prasanna <me@supree.co.uk>"
LABEL version="0.10.0"
LABEL opencvversion="3.4.6"
LABEL pythonversion="3.6.9"
LABEL ubuntuversion="18.04"

ARG OCVVERSION=3.4.6


RUN apt-get update -q -y && \
        apt-get upgrade -q -y

RUN apt-get install -y software-properties-common
RUN apt-get install -y tesseract-ocr

RUN add-apt-repository "deb [arch=amd64,i386] http://security.ubuntu.com/ubuntu bionic-security main"

RUN apt-get install -y build-essential cmake unzip pkg-config \
        libjpeg-dev libpng-dev libtiff-dev \
        libavcodec-dev libavformat-dev libswscale-dev libv4l-dev \
        libxvidcore-dev libx264-dev \
        libatlas-base-dev gfortran \
        python3-dev \
        wget curl \
        libjasper-dev libjasper1 \
        openexr \
        libeigen3-dev libgflags-dev libgoogle-glog-dev


RUN wget -O opencv.zip https://github.com/opencv/opencv/archive/${OCVVERSION}.zip && \
        wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/${OCVVERSION}.zip

RUN unzip opencv.zip && \
        unzip opencv_contrib.zip

RUN mv opencv-${OCVVERSION} opencv && \
        mv opencv_contrib-${OCVVERSION} opencv_contrib

RUN wget https://bootstrap.pypa.io/get-pip.py && \
        python3 get-pip.py
RUN pip install numpy

RUN python3 --version

RUN cd /opencv && \
        mkdir build && \
        cd build && \
        cmake -D CMAKE_BUILD_TYPE=RELEASE \
	-D CMAKE_INSTALL_PREFIX=/usr/local \
	-D INSTALL_PYTHON_EXAMPLES=OFF \
	-D INSTALL_C_EXAMPLES=OFF \
	-D OPENCV_ENABLE_NONFREE=ON \
	-D OPENCV_EXTRA_MODULES_PATH=/opencv_contrib/modules \
	-D BUILD_EXAMPLES=ON .. && \
        make && \
        make install && \
        ldconfig

RUN rm -rf /opencv && \
        rm -rf /opencv_contrib && \
        rm -rf opencv.zip && \
        rm -rf opencv_contrib.zip

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
