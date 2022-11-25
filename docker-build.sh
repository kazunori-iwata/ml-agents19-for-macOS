#! /bin/sh
# image 名を固定するため

docker build -t ml-agents .

if [ ! -d ml-agents ]; then
    git clone https://github.com/Unity-Technologies/ml-agents.git
fi
