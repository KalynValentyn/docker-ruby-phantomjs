FROM lits/rails-nginx-unicorn

RUN apt-get update
RUN apt-get install -y libpq-dev
RUN npm install phantomjs -g
