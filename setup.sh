#! /bin/sh

cd ml-agents

if [ ! -f .setup ]; then
    pip3 install -e ./ml-agents-envs
    pip3 install -e ./ml-agents
    touch .setup
fi

