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

FROM lits/rails-nginx-unicorn:ruby-2.3

### Replace shell with bash so we can source files ###
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update

### install libs for postgres ###
RUN apt-get install -y libpq-dev


RUN apt-get install -y build-essential libssl-dev

RUN apt-get install -y npm

RUN npm cache clean -f && npm install -g n && n stable

RUN sed -i.bak 's/main$/main universe/' /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

# Install and setup project dependencies
RUN apt-get install -y curl wget unzip
RUN locale-gen en_US en_US.UTF-8

# Install display server
#RUN apt-get install -y xorg xserver-xorg-video-dummy
RUN apt-get install -y xvfb gtk2-engines-pixbuf
RUN apt-get install -y xfonts-cyrillic xfonts-100dpi xfonts-75dpi xfonts-base xfonts-scalable
RUN apt-get install -y x11-apps

# Install Firefox
RUN apt-get install -y firefox
# Install Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - 
RUN sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN apt-get update 
RUN apt-get install -y google-chrome-stable

RUN cd /root/ && wget -N http://chromedriver.storage.googleapis.com/2.10/chromedriver_linux64.zip
RUN unzip /root/chromedriver_linux64.zip -d /root
RUN chmod +x /root/chromedriver
RUN mv -f /root/chromedriver /usr/local/share/chromedriver
RUN ln -s /usr/local/share/chromedriver /usr/local/bin/chromedriver
RUN ln -s /usr/local/share/chromedriver /usr/bin/chromedriver
