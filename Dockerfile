FROM ruby:2.7.0

# ENV TZ=Asia/Tokyo

# RUN \
#     apt-get update && \
#     apt-get install -y \
#     git \
#     default-mysql-client
#
# WORKDIR /api-rails
#
# COPY ./Gemfile /api-rails
# COPY ./Gemfile.lock /api-rails
# RUN bundle install --path vendor/bundle -j4
#
# COPY . /api-rails


# ARG USERNAME
# ARG ACCESS_TOKEN

# ENV BUNDLE_GITHUB__COM=$USERNAME:$ACCESS_TOKEN

WORKDIR /shitsukomi
# ADD Gemfile /shitsukomi/Gemfile
# ADD Gemfile.lock /shitsukomi/Gemfile.lock

RUN set -x && \
    apt-get -qq update && \
    apt-get -qq upgrade -y && \
    apt-get -qq install -y build-essential
    # \
    # bundle install

COPY . /shitsukomi

# CMD ["rails", "server", "-b", "0.0.0.0"]
