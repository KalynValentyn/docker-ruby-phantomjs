FROM lits/rails-nginx-unicorn:ruby-2.3

RUN apt-get update

### install libs for postgres ###
RUN apt-get install -y libpq-dev

### install phantomsJS ###
RUN apt-get install -y phantomjs  

### NVM and nodeJS ###
# Install a C++ Compiler 
RUN apt-get install -y build-essential libssl-dev
# Install nodejs 
RUN apt-get install -y nodejs
# Add nvm command to bash profile
RUN npm install -g n
RUN n stable
