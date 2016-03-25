FROM lits/rails-nginx-unicorn:ruby-2.3

RUN apt-get update

### install libs for postgres ###
RUN apt-get install -y libpq-dev

### install phantomsJS ###
RUN apt-get install -y phantomjs  

### NVM and nodeJS ###
# Install a C++ Compiler 
RUN apt-get install -y build-essential libssl-dev
# Install NVM 
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
# Add nvm command to bash profile
RUN /bin/bash -c source ~/.profile 
# Install node stable
RUN nvm install stable
# Use latest stable version nodeJS
RUN nvm use stable  
