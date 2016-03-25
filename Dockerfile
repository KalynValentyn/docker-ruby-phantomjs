FROM lits/rails-nginx-unicorn:ruby-2.3

### Replace shell with bash so we can source files ###
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update

### install libs for postgres ###
RUN apt-get install -y libpq-dev

### install phantomsJS ###
RUN apt-get install -y phantomjs  

### NVM and nodeJS ###
# Install a C++ Compiler 
RUN apt-get install -y build-essential libssl-dev

ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 5.8.0

# Install nvm with node and npm
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.30.2/install.sh | bash \
    && source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default
