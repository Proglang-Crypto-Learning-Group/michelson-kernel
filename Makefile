FROM python:3.7-slim-buster

RUN apt-get update && \
    apt-get install -y build-essential pkg-config libsodium-dev libsecp256k1-dev libgmp-dev npm && \
    rm -rf /var/lib/apt/lists/*
RUN pip install jupyterhub
RUN pip install --upgrade notebook
RUN npm install -g configurable-http-proxy

# USER jupyter
WORKDIR /home/jupyter

RUN pip install pytezos==2.4.11 michelson-kernel>=0.1.6

EXPOSE 8000
ENTRYPOINT [ "jupyter",  "notebook", "--port=8888", "--ip=0.0.0.0", "--no-browser", "--no-mathjax", "--allow-root"]
# ENTRYPOINT ["jupyterhub"]
