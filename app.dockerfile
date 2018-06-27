# BASIC INSTALL
FROM ruby:2.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs postgresql-client

# TINY TDS (NEWER VERSION DON'T HANDLE SQL2005 BUT THIS VERSION IS STUCK ON RUBY 2.4.2)
#FROM ruby:2.4.2
#RUN wget http://www.freetds.org/files/stable/freetds-1.00.21.tar.gz
#RUN tar -xzf freetds-1.00.21.tar.gz
#RUN cd freetds-1.00.21 && ./configure --prefix=/usr/local --with-tdsver=7.2 # sql 2005
#RUN cd freetds-1.00.21 && make
#RUN cd freetds-1.00.21 && make install

# RAILS 5.2 WITH WEB PACKER
#FROM RUBY
#RUN apt-get update -qq && apt-get install -y apt-transport-https ca-certificates
#RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
#RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
#RUN apt-get update -qq && apt-get install -y build-essential libpq-dev yarn
#RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
#RUN apt-get update -qq && apt-get install -y nodejs imagemagick vim postgresql-client

RUN mkdir /app
WORKDIR /app
COPY ./app /app
