# syntax=docker/dockerfile:1

ARG BUILD gpu

####################################################################################################
# GPU Build: Py3.8 with TF (2.7.0 GPU)
####################################################################################################
FROM tensorflow/tensorflow:2.7.0-gpu AS gpu-server

RUN apt-get -y install git

RUN pip install --upgrade pip

RUN pip install \
	scikit-learn>=1.0.0 \
	pandas>=1.3.0 \
	numpy>=1.20.3 \
	catboost>=0.26 \
	numba>=0.53.0 \
	seaborn>=0.11.0 \
	matplotlib>=3.4.0 \
	transformers>=4.12.0 \
	tensorflow-recommenders>=0.6.0 \
	tensorflow-datasets>=4.4.0

####################################################################################################
# Jupyter Build: GPU build with Notebook
####################################################################################################
# FROM gpu-server AS notebook-server

# RUN pip install notebook>=6.4.5

# WORKDIR home/

# # ENV TINI_VERSION v0.6.0
# # ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
# # RUN chmod +x /usr/bin/tini
# # ENTRYPOINT ["/usr/bin/tini", "--"]

# EXPOSE 8888
# CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]

####################################################################################################
# Select Build
####################################################################################################
FROM ${BUILD}-server AS selected-build-0
