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
or 
$ docker load -i tensorflow-1808-py3.tar.gz (if you have a tar archive of the docker image) 
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

## Problem encountered and solution
### If the following error happens, try changing ip in Dockerfile and jupyter_notebook_config.py from * to 0.0.0.0 
```
[I 09:47:57.413 NotebookApp] Writing notebook server cookie secret to /root/.local/share/jupyter/runtime/notebook_cookie_secret
Traceback (most recent call last):
  File "/root/.virtualenvs/py3cv4/lib/python3.5/site-packages/traitlets/traitlets.py", line 528, in get
    value = obj._trait_values[self.name]
KeyError: 'allow_remote_access'

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/root/.virtualenvs/py3cv4/lib/python3.5/site-packages/notebook/notebookapp.py", line 869, in _default_allow_remote
    addr = ipaddress.ip_address(self.ip)
  File "/usr/lib/python3.5/ipaddress.py", line 54, in ip_address
    address)
ValueError: '' does not appear to be an IPv4 or IPv6 address

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/root/.virtualenvs/py3cv4/bin/jupyter-notebook", line 11, in <module>
    sys.exit(main())
  File "/root/.virtualenvs/py3cv4/lib/python3.5/site-packages/jupyter_core/application.py", line 266, in launch_instance
    return super(JupyterApp, cls).launch_instance(argv=argv, **kwargs)
  File "/root/.virtualenvs/py3cv4/lib/python3.5/site-packages/traitlets/config/application.py", line 657, in launch_instance
    app.initialize(argv)
  File "<decorator-gen-7>", line 2, in initialize
  File "/root/.virtualenvs/py3cv4/lib/python3.5/site-packages/traitlets/config/application.py", line 87, in catch_config_error
    return method(app, *args, **kwargs)
  File "/root/.virtualenvs/py3cv4/lib/python3.5/site-packages/notebook/notebookapp.py", line 1629, in initialize
    self.init_webapp()
  File "/root/.virtualenvs/py3cv4/lib/python3.5/site-packages/notebook/notebookapp.py", line 1379, in init_webapp
    self.jinja_environment_options,
  File "/root/.virtualenvs/py3cv4/lib/python3.5/site-packages/notebook/notebookapp.py", line 158, in __init__
    default_url, settings_overrides, jinja_env_options)
  File "/root/.virtualenvs/py3cv4/lib/python3.5/site-packages/notebook/notebookapp.py", line 251, in init_settings
    allow_remote_access=jupyter_app.allow_remote_access,
  File "/root/.virtualenvs/py3cv4/lib/python3.5/site-packages/traitlets/traitlets.py", line 556, in __get__
    return self.get(obj, cls)
  File "/root/.virtualenvs/py3cv4/lib/python3.5/site-packages/traitlets/traitlets.py", line 535, in get
    value = self._validate(obj, dynamic_default())
  File "/root/.virtualenvs/py3cv4/lib/python3.5/site-packages/notebook/notebookapp.py", line 872, in _default_allow_remote
    for info in socket.getaddrinfo(self.ip, self.port, 0, socket.SOCK_STREAM):
  File "/usr/lib/python3.5/socket.py", line 732, in getaddrinfo
    for res in _socket.getaddrinfo(host, port, family, type, proto, flags):
socket.gaierror: [Errno -5] No address associated with hostname
```
