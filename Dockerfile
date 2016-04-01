FROM lits/rails-nginx-unicorn:ruby-2.3

### Replace shell with bash so we can source files ###
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update

### install libs for postgres ###
RUN apt-get install -y libpq-dev

### install phantomsJS ###
RUN cd ~ && wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 \
 && tar xvjf phantomjs-2.1.1-linux-x86_64.tar.bz2 \
 && cp phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin/

RUN apt-get install -y build-essential libssl-dev

RUN apt-get install -y npm

RUN npm cache clean -f && npm install -g n && n stable
