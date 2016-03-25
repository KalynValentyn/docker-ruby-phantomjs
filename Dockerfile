FROM lits/rails-nginx-unicorn:ruby-2.3

RUN apt-get update

### install libs for postgres ###
RUN apt-get install -y libpq-dev

### install phantomsJS ###
RUN apt-get install -y phantomjs  

### NVM and nodeJS ###
RUN apt-get install -y build-essential libssl-dev  # Install a C++ Compiler 
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash   # Install NVM 
RUN source ~/.profile   # Add nvm command to bash profile
RUN nvm install stable  # Install node stable
RUN nvm use stable      # Use latest stable version nodeJS
