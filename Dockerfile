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
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.30.2/install.sh | bash
ENV PATH $PATH:/root/.rvm/bin/rvm
# Add nvm command to bash profile
RUN nvm install stable
RUN nvm usee stable
