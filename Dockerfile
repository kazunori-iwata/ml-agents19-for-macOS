FROM ubuntu:22.04
MAINTAINER Kazunori Iwata

ENV PATH /usr/bin:/usr/local/bin:$PATH

RUN apt-get -y upgrade && apt-get update && apt-get install -y curl software-properties-common vim && add-apt-repository ppa:deadsnakes/ppa

ENV LANG C.UTF-8

ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get install -y python3.7
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 1
RUN apt-get -y install python3.7-distutils && apt-get install -y python3-pip git


RUN python3 -m pip install --upgrade pip
# mlagents で最新版だとエラー LTS(1.8.1) なら OK 
RUN pip3 install torch==1.8.1 torchvision==0.9.1 torchaudio==0.13.0 --extra-index-url https://download.pytorch.org/whl/lts/1.8/cpu

# mlagents で最新版だとエラーなのでこちらは使わない
# RUN pip3 install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cpu

COPY setup.sh /

RUN mkdir /home/tmpuser

RUN useradd tmpuser
RUN USER=tmpuser && \
    GROUP=tmpuser && \
    curl -SsL https://github.com/boxboat/fixuid/releases/download/v0.5/fixuid-0.5-linux-amd64.tar.gz | tar -C /usr/local/bin -xzf - && \
    chmod 4755 /usr/local/bin/fixuid && \
    mkdir -p /etc/fixuid && \
    printf "user: $USER\ngroup: $GROUP\n" > /etc/fixuid/config.yml

RUN chown tmpuser:tmpuser /home/tmpuser
USER tmpuser:tmpuser
ENV PATH /home/tmpuser/.local/bin:$PATH

#WORKDIR /ml-agents/ml-agents-envs
#RUN pip3 install -e .
#WORKDIR /ml-agents/ml-agents
#RUN pip3 install -e .


# port 5004 is the port used in Editor training.
# port 6006 is the port used by tensorboard.
EXPOSE 5004 6006

ENTRYPOINT ["fixuid"]

