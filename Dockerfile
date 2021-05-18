FROM ubuntu:20.04

# Determines if this node is for a testnet or the mainnet
# (testnet|mainnet)
ENV NETWORK=testnet

LABEL maintainer="josephcuffney@gmail.com"

WORKDIR /cardano-node

RUN echo ${NETWORK}

RUN apt-get update && apt-get upgrade

RUN apt-get install -y \
    wget

# https://docs.cardano.org/projects/cardano-node/en/latest/stake-pool-operations/getConfigFiles_AND_Connect.html#get-configuration-files

# Download Config Files
RUN wget "https://hydra.iohk.io/job/Cardano/cardano-node/cardano-deployment/latest-finished/download/1/${NETWORK}-config.json" \
    && wget "https://hydra.iohk.io/job/Cardano/cardano-node/cardano-deployment/latest-finished/download/1/${NETWORK}-byron-genesis.json" \
    && wget "https://hydra.iohk.io/job/Cardano/cardano-node/cardano-deployment/latest-finished/download/1/${NETWORK}-shelley-genesis.json" \
    && wget "https://hydra.iohk.io/job/Cardano/cardano-node/cardano-deployment/latest-finished/download/1/${NETWORK}-topology.json"

# RUN cardano-node run --help

# RUN export CARDANO_NODE_SOCKET_PATH=path/to/db/node.socket

# RUN  cardano-node run \
#    --topology path/to/mainnet-topology.json \
#    --database-path path/to/db \
#    --socket-path path/to/db/node.socket \
#    --host-addr x.x.x.x \
#    --port 3001 \
#    --config path/to/mainnet-config.json

# EXPOSE 8080

# CMD [ "executable" ]