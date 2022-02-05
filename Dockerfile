# syntax=docker/dockerfile:1
FROM ruby:2.7.4-alpine

ENV APP_PATH /var/app
ARG BUNDLER_VERSION
ENV BUNDLER_VERSION=${BUNDLER_VERSION:-2.3.6}

RUN apk -U add --no-cache \
build-base \
git \
postgresql-dev \
postgresql-client \
libxml2-dev \
libxslt-dev \
nodejs \
yarn \
imagemagick \
tzdata \
less \
&& rm -rf /var/cache/apk/* \
&& mkdir -p $APP_PATH

WORKDIR $APP_PATH
COPY Gemfile /Gemfile
COPY Gemfile.lock /Gemfile.lock

ENV LANG=C.UTF-8 \
  BUNDLE_JOBS=4 \
  BUNDLE_RETRY=3

WORKDIR /app
# Upgrade RubyGems and install required Bundler version
RUN gem update --system && \
  gem install bundler -v $BUNDLER_VERSION
RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0",]

