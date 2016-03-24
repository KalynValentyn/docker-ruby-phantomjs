FROM lits/rails-nginx-unicorn:ruby-2.3

RUN apt-get update
RUN apt-get install -y libpq-dev
RUN apt-get install -y phantomjs
