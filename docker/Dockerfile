# syntax=docker/dockerfile:1

ARG BUILD base

####################################################################################################
# Base Build: Python + TF 2.6 GPU
####################################################################################################
FROM tensorflow/tensorflow:2.6.0-gpu AS base-server

RUN pip install --upgrade pip
RUN pip install \
	pandas>=1.3.0 \
	numpy>=1.20.3 \
	catboost>=0.26 \
	numba>=0.53.0 \
	seaborn==0.11.0 \
	matplotlib>=3.4.0 \
	yfinance>=0.1.0 \
	nltk>=3.5 \
	spacy>=3.0.0 \
	gensim>=4.0.0 \
	transformers>=4.12.0 \
	tfx>=1.3.0 \
	ray>=1.8.0

####################################################################################################
# Jupyter Build: Base Build + Jupyter Notebook
####################################################################################################
FROM base-server AS jp-server

RUN pip install notebook

EXPOSE 8888
CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]

####################################################################################################
# Select Build
####################################################################################################
FROM ${BUILD}-server AS selected-build-0

# # COMMANDS
# # docker images
# # docker rmi image-id
# # docker ps -a
# # docker container prune
# # docker build -t name -f Dockerfile --build-arg BUILD=build-name .
# # docker run --gpus all -it --rm name:tag python -c "import tensorflow as tf; print(tf.reduce_sum(tf.random.normal([1000, 1000])))"
# # docker run --gpus all -it --rm name:tag
