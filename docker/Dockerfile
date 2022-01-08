# syntax=docker/dockerfile:1

ARG BUILD base

####################################################################################################
# Base Build: Python-3.8.12
####################################################################################################
FROM python:3.8.12-bullseye AS base-server

RUN apt-get -y install git

RUN pip install --upgrade pip

RUN apt-get update \
	&& apt-get -y install libpq-dev gcc \
	&& pip install psycopg2

RUN pip install \
	scikit-learn>=1.0.0 \
	pandas>=1.3.0 \
	numpy>=1.20.3 \
	catboost>=0.26 \
	seaborn>=0.11.0 \
	matplotlib>=3.4.0 \
	ipywidgets>=7.6.5 \
	notebook>=6.4.5

####################################################################################################
# GPU Build: TensorFlow-2.7.0-GPU
####################################################################################################
FROM tensorflow/tensorflow:2.7.0-gpu AS gpu-server

RUN apt-get update

RUN pip install --upgrade pip

RUN apt -y install graphviz

RUN apt-get -y install git

RUN apt-get update \
	&& apt-get -y install libpq-dev gcc \
	&& pip install psycopg2

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
	tensorflow-datasets>=4.4.0 \
	tensorflow-hub>=0.12.0 \
	tensorflow-text>=2.7.3 \
	tf-models-official>=2.7.0 \
	scann>=1.2.4 \
	pydot>=1.4.2 \
	ipywidgets>=7.6.5 \
	notebook>=6.4.5

####################################################################################################
# Select Build
####################################################################################################
FROM ${BUILD}-server AS selected-build-0
