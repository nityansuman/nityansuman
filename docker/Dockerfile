# syntax=docker/dockerfile:1

FROM tensorflow/tensorflow:2.6.0-gpu

WORKDIR /tf

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
	transformers>=4.12.0
	# notebook>=6.4.0

# EXPOSE 8888

# CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]

# Test docker with TF and GPU
# docker run --gpus all -it --rm dev-dock:latest python -c "import tensorflow as tf; print(tf.reduce_sum(tf.random.normal([1000, 1000])))"
