FROM ubuntu:24.04

ENV PYTHON_VERSION=3.13.5

# 必要なビルドツールやライブラリをインストール
RUN apt-get update && apt-get install -y \
    build-essential \
    wget \
    curl \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    libncursesw5-dev \
    libffi-dev \
    libgdbm-dev \
    liblzma-dev \
    tk-dev \
    uuid-dev \
    xz-utils \
    git \
    ca-certificates \
    default-libmysqlclient-dev \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Python ソースをダウンロード＆ビルド
RUN wget https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz && \
    tar xzf Python-${PYTHON_VERSION}.tgz && \
    cd Python-${PYTHON_VERSION} && \
    ./configure --enable-optimizations && \
    make -j$(nproc) && \
    make altinstall && \
    cd .. && rm -rf Python-${PYTHON_VERSION}*

WORKDIR /app
COPY requirements.txt /app/

# pip アップグレード
RUN python3.13 -m ensurepip && python3.13 -m pip install --upgrade pip
RUN python3.13 -m pip install -r requirements.txt
