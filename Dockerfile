FROM phusion/passenger-customizable:1.0.12

# Adding argument support for ping.json
ARG APPVERSION=unknown
ARG APP_BUILD_DATE=unknown
ARG APP_GIT_COMMIT=unknown
ARG APP_BUILD_TAG=unknown

# Setting up ping.json variables
ENV APPVERSION ${APPVERSION}
ENV APP_BUILD_DATE ${APP_BUILD_DATE}
ENV APP_GIT_COMMIT ${APP_GIT_COMMIT}
ENV APP_BUILD_TAG ${APP_BUILD_TAG}

RUN /pd_build/ruby-2.6.*.sh
RUN /pd_build/nodejs.sh
# fix to address http://tzinfo.github.io/datasourcenotfound - PET ONLY
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -q && \
    apt-get install -qy tzdata --no-install-recommends && apt-get clean && \
    rm -rf /var/lib/apt/lists/* && rm -fr *Release* *Sources* *Packages* && \
    truncate -s 0 /var/log/*log

ENV UNICORN_PORT 3000
EXPOSE $UNICORN_PORT

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ONBUILD COPY Gemfile /usr/src/app/
ONBUILD COPY Gemfile.lock /usr/src/app/

ONBUILD RUN gem install bundler -v 2.2.8
ONBUILD RUN bundle install --without test development
ONBUILD RUN npm install
ONBUILD RUN bash -c "bundle exec rake assets:precompile RAILS_ENV=production SECRET_TOKEN=blah"


# running app as a service
ENV PHUSION true
COPY run.sh /usr/src/app/run
RUN chmod +x /usr/src/app/run