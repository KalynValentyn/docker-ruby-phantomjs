FROM lits/rails-nginx-unicorn:ruby-2.3

### Replace shell with bash so we can source files ###
RUN rm /bin/sh && ln -s /bin/bash /bin/sh && \
    sed -i 's/^mesg n$/tty -s \&\& mesg n/g' /root/.profile

ENV NVM_DIR /usr/local/nvm
ENV PATH $NVM_DIR/bin:/usr/local/rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH

RUN apt-get update

### install libs for postgres ###
RUN apt-get install -y libpq-dev

### install phantomsJS ###
RUN apt-get install -y phantomjs  

### NVM and nodeJS ###
# Install a C++ Compiler 
RUN apt-get install -y build-essential libssl-dev

## RUN apt-get install -y npm

ENV NVM_DIR /usr/local/nvm
#ENV NODE_VERSION 5.8.0

# Install nvm with node and npm
COPY .nvmrc /app/.nvmrc
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.30.2/install.sh | bash && \
    echo 'source $NVM_DIR/nvm.sh' >> /etc/profile && \
    /bin/bash -l -c "nvm install;" \
    "nvm use;"
#    && source $NVM_DIR/nvm.sh \
#    && nvm install $NODE_VERSION \
#    && nvm alias default $NODE_VERSION \
#    && nvm use default 
#
#ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
#ENV PATH      $NVM_DIR/v$NODE_VERSION/bin:$PATH

