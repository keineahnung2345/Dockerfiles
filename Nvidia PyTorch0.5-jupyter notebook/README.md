# Nvidia PyTorch0.5+jupyter notebook

This docker image is based on nvcr.io/nvidia/pytorch:18.09-py3.

But it also adds jupyter notebook and some other useful packages like keras and sklearn for machine learning and deep learning.

## Its environment
Ubuntu 16.04

CUDA 10.0.130

PyTorch 0.5.0a0

## To use it
```sh
$ docker pull nvcr.io/nvidia/pytorch:18.09-py3
$ git clone https://github.com/keineahnung2345/Dockerfiles.git
$ cd Dockerfiles/Nvidia PyTorch0.5-jupyter notebook
$ docker build . --no-cache -t nvcr.io/nvidia/pytorch:18.09-py3-jupyter \
-f Dockerfile-PyTorch1809
$ NV_GPU=<your_gpu_ids> nvidia-docker run --name pt-jupyter -td -p 8888:8888 \
-v /home/<your_user_name>/tensorflow-tensorlog:/tensorlog \
-v /home/<your_user_name>/tensorflow-data:/notebooks \
-v /var/tensorflow-dataset:/mnt -e PASSWORD=<password_for_jupyter_notebook> \
--restart always nvcr.io/nvidia/pytorch:18.09-py3-jupyter
```

Note: When some packages cannot be installed, add --no-cache after docker build so that "apt-get update" will be executed

And then open your browser and navigate to <http://your_host_ip:8888>, after keying in the password you have set, you can start to use jupyter notebook.

## To enter the docker you have built

docker exec -it pt-jupyter bash

## Problem encountered and solution
### If the following error happens, try `pip install jupyter==1.0.0` and `pip install prompt-toolkit==1.0.15` 
```
[E 00:38:12.179 NotebookApp] Exception while loading config file /root/.jupyter/jupyter_notebook_config.py
    Traceback (most recent call last):
      File "/opt/conda/lib/python3.6/site-packages/traitlets/config/application.py", line 562, in _load_config_files
        config = loader.load_config()
      File "/opt/conda/lib/python3.6/site-packages/traitlets/config/loader.py", line 457, in load_config
        self._read_file_as_dict()
      File "/opt/conda/lib/python3.6/site-packages/traitlets/config/loader.py", line 489, in _read_file_as_dict
        py3compat.execfile(conf_filename, namespace)
      File "/opt/conda/lib/python3.6/site-packages/ipython_genutils/py3compat.py", line 198, in execfile
        exec(compiler(f.read(), fname, 'exec'), glob, loc)
      File "/root/.jupyter/jupyter_notebook_config.py", line 16, in <module>
        from IPython.lib import passwd
      File "/opt/conda/lib/python3.6/site-packages/IPython/__init__.py", line 55, in <module>
        from .terminal.embed import embed
      File "/opt/conda/lib/python3.6/site-packages/IPython/terminal/embed.py", line 16, in <module>
        from IPython.terminal.interactiveshell import TerminalInteractiveShell
      File "/opt/conda/lib/python3.6/site-packages/IPython/terminal/interactiveshell.py", line 22, in <module>
        from prompt_toolkit.shortcuts import create_prompt_application, create_eventloop, create_prompt_layout, create_output
    ImportError: cannot import name 'create_prompt_application'
```
