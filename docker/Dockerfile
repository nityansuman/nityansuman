# syntax=docker/dockerfile:1
ARG BUILD

####################################################################################################
# GPU Build: TensorFlow-GPU
####################################################################################################
FROM tensorflow/tensorflow:2.12.0-gpu AS tf2-server

RUN apt-get -y update
RUN apt-get -y install git
RUN pip install --upgrade pip
RUN pip install --upgrade setuptools wheel
RUN apt -y install graphviz
RUN apt-get update \
	&& apt-get -y install libpq-dev gcc \
	&& pip install psycopg2

RUN pip install \
	scikit-learn>=1.0.0 \
	pandas>=1.5.1 \
	numpy>=1.20.3 \
	catboost>=0.26 \
	numba>=0.53.0 \
	seaborn>=0.11.0 \
	matplotlib>=3.4.0 \
	tensorflow-text>=2.7.3 \
	tensorflow-io>=0.23.1 \
	tensorflow-recommenders>=0.6.0 \
	tensorflow-hub>=0.12.0 \
	tensorflow-datasets>=4.4.0 \
	tf-models-official>=2.7.0 \
	scann>=1.2.4 \
	pydot>=1.4.2 \
	ipywidgets>=7.6.5 \
	notebook>=6.4.5 \
	pyarrow>=7.0.0 \
	boto3>=1.21.20 \
	yfinance>=0.1.70 \
	spacy>=3.2.0 \
	streamlit>=1.20.0

RUN python -m spacy download en_core_web_trf
RUN python -m spacy download en_core_web_lg

####################################################################################################
# Select Build
####################################################################################################
FROM ${BUILD}-server AS selected-build-0
