# Nvidia TF1.9+jupyter notebook

This docker image is based on nvcr.io/nvidia/tensorflow:18.08-py3.

But it also adds jupyter notebook and some other useful packages like keras and sklearn for machine learning and deep learning.

## Its environment
Ubuntu 16.04

CUDA 9.0.176

cuDNN 7.2.1

TensorFlow 1.9

OpenCV 4.0.0

PyCuda (2018, 1, 1)

## To use it
```sh
$ docker pull nvcr.io/nvidia/tensorflow:18.08-py3
$ git clone https://github.com/keineahnung2345/Dockerfiles.git
$ cd Dockerfiles/Nvidia TF1.9+jupyter notebook
$ docker build . --no-cache -t nvcr.io/nvidia/tensorflow:18.08-py3-jupyter-opencv
$ NV_GPU=<your_gpu_ids> nvidia-docker run --name tf-jupyter -td -p 8888:8888 -p 6006:6006 \
-v /home/<your_user_name>/tensorflow-tensorlog:/tensorlog \
-v /home/<your_user_name>/tensorflow-data:/notebooks \
-v /var/tensorflow-dataset:/mnt -e PASSWORD=<password_for_jupyter_notebook> \
--restart always nvcr.io/nvidia/tensorflow:18.08-py3-jupyter-opencv
```

Note: When some packages cannot be installed, add --no-cache after docker build so that "apt-get update" will be executed

And then open your browser and navigate to <http://your_host_ip:8888>, after keying in the password you have set, you can start to use jupyter notebook.

## To enter the docker you have built

docker exec -it nvcr.io/nvidia/tensorflow:18.08-py3-jupyter-opencv bash
