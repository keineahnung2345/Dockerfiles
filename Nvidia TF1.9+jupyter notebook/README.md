This docker image is based on nvcr.io/nvidia/tensorflow:18.07-py3.
But it also adds jupyter notebook and some other useful packages for machine learning and deep learning.

The environment is:
Ubuntu 16.04
TensorFlow 1.9

To use it:
1. docker pull nvcr.io/nvidia/tensorflow:18.07-py3
2. clone this repository and cd to the directory containing this file
3. docker build . -t nvcr.io/nvidia/tensorflow:18.08-py3-jupyter
4. NV_GPU=<your_gpu_ids> nvidia-docker run --name tf-jupyter -td -p 8888:8888 -p 6006:6006 -v /root/tensorflow-tensorlog:/tensorlog -v /root/tensorflow-data:/notebooks -v /var/tensorflow-dataset:/mnt -e PASSWORD=<password_for_jupyter_notebook> --restart always nvcr.io/nvidia/tensorflow:18.08-py3-jupyter
5. open your browser and navigate to <http://your_host_ip:8888>, after keying in the password you have set, you can start to use jupyter notebook

To enter the docker you have built:
docker exec -it tf-jupyter bash