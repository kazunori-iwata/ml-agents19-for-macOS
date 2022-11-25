#!/bin/sh

localUID=$(id -u $USER)
localGID=$(id -g $USER)
#docker run -u ${localUID}:${localGID} -p 5004:5004 -p 6006:6006 -v ${PWD}/ml-agents:/ml-agents --name ml-agents ml-agents /bin/sh /setup.sh

#docker exec -it ml-agents /bin/bash

docker run -it -u ${localUID}:${localGID} -p 5004:5004 -p 6006:6006 -v ${PWD}/ml-agents:/ml-agents --name ml-agents ml-agents /bin/bash

