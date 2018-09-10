FROM nvcr.io/nvidia/tensorflow:18.07-py3

RUN apt-get update && apt-get -y upgrade

RUN apt-get install -y net-tools lsof

RUN pip3 install --upgrade pip

RUN pip3 install --upgrade numpy

RUN pip3 install jupyter keras sklearn matplotlib opencv-python scikit-image h5py

USER root

RUN mkdir /notebooks 

WORKDIR /notebooks

RUN jupyter notebook --generate-config

ENV CONFIG_PATH="/root/.jupyter/jupyter_notebook_config.py"

COPY "jupyter_notebook_config.py" ${CONFIG_PATH}

ENTRYPOINT ["sh", "-c", "jupyter notebook --allow-root -y --no-browser --ip=* --config=${CONFIG_PATH}"]
