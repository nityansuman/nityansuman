# syntax=docker/dockerfile:1
ARG BUILD

####################################################################################################
# Development Environment with GPU Support
####################################################################################################
FROM tensorflow/tensorflow:latest-gpu AS dev-env

RUN apt-get -y update
RUN apt-get -y install git
RUN pip install --upgrade pip
RUN pip install --upgrade setuptools wheel
RUN apt -y install graphviz
RUN apt-get update \
	&& apt-get -y install libpq-dev gcc \
	&& pip install psycopg2

RUN pip install \
	scikit-learn\
	pandas\
	numpy \
	catboost \
	numba \
	seaborn \
	matplotlib \
	fastapi \
	flask \
	flask-cors \
	flask-login \
	flask-socketio \
	flask-wtf \
	requests \
	requests-ftp \
	chromadb \
	redis \
	wordcloud \
	tensorflow-text \
	tensorflow-io \
	tensorflow-recommenders \
	tensorflow-hub \
	tensorflow-datasets \
	tf-models-official \
	psycopg2 \
	boto3 \
	pydot \
	ipywidgets \
	notebook \
	pyarrow \
	transformers \
	sentence-transformers \
	tqdm

####################################################################################################
# Select Build
####################################################################################################
FROM ${BUILD}-env AS selected-build-0
