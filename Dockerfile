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

ENV NVM_DIR /root/.nvm
# Install NVM 
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.30.2/install.sh | bash
RUN source ~/.profile
##    && source $NVM_DIR/nvm.sh
# Add nvm command to bash profile
RUN nvm install stable
RUN nvm usee stable
