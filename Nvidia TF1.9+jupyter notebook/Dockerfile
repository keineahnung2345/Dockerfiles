FROM nvcr.io/nvidia/tensorflow:18.07-py3

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y upgrade

RUN apt-get install -y apt-utils

RUN apt-get install -y net-tools lsof

#Install Dependencies of OpenCV

RUN apt-get install -y build-essential cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev

RUN apt-get install -y python3.5-dev python3-numpy libtbb2 libtbb-dev

RUN apt-get install -y libjpeg-dev libpng-dev libtiff5-dev libjasper-dev libdc1394-22-dev libeigen3-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev sphinx-common libtbb-dev yasm libfaac-dev libopencore-amrnb-dev libopencore-amrwb-dev libopenexr-dev libgstreamer-plugins-base1.0-dev libavutil-dev libavfilter-dev libavresample-dev

#Get OpenCV

RUN apt-get install -y sudo

RUN sudo -s

WORKDIR /opt

RUN git clone https://github.com/Itseez/opencv.git

RUN git clone https://github.com/Itseez/opencv_contrib.git

#Build and install OpenCV
WORKDIR /opt/opencv

RUN mkdir release

WORKDIR /opt/opencv/release

RUN cmake -D BUILD_TIFF=ON -D WITH_CUDA=OFF -D ENABLE_AVX=OFF -D WITH_OPENGL=OFF -D WITH_OPENCL=OFF -D WITH_IPP=OFF -D WITH_TBB=ON -D BUILD_TBB=ON -D WITH_EIGEN=OFF -D WITH_V4L=OFF -D WITH_VTK=OFF -D BUILD_TESTS=OFF -D BUILD_PERF_TESTS=OFF -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D OPENCV_EXTRA_MODULES_PATH=/opt/opencv_contrib/modules /opt/opencv/

RUN make -j4

RUN make install

RUN ldconfig

RUN exit

RUN apt-get install -y libncurses5-dev libncursesw5-dev

#Install Python and machine learning, deep learning packages
RUN python3 -m pip install --upgrade pip

RUN python3 -m pip install --upgrade numpy

RUN python3 -m pip install jupyter keras sklearn matplotlib opencv-python scikit-image h5py

RUN python3 -m pip install pycuda

USER root

RUN mkdir /notebooks 

WORKDIR /notebooks

RUN jupyter notebook --generate-config

ENV CONFIG_PATH="/root/.jupyter/jupyter_notebook_config.py"

COPY "jupyter_notebook_config.py" ${CONFIG_PATH}

ENTRYPOINT ["sh", "-c", "jupyter notebook --allow-root -y --no-browser --ip=0.0.0.0 --config=${CONFIG_PATH}"]
