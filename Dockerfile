FROM ruby:2.7.0

WORKDIR /shitsucomi
ADD Gemfile /shitsucomi/Gemfile
ADD Gemfile.lock /shitsucomi/Gemfile.lock

RUN set -x && \
    apt-get -qq update && \
    apt-get -qq upgrade -y && \
    apt-get -qq install -y build-essential && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get -qq update && apt-get -y install yarn && \
    bundle install

COPY . /shitsucomi

RUN yarn install
