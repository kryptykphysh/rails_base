ARG CONTAINER_GID=3434 \
    CONTAINER_UID=3434 \
    CONTAINER_USER=app_user \
    POSTGRES_VERSION=15 \
    RUBY_VERSION=3.2

FROM ruby:${RUBY_VERSION}-bullseye

ARG CONTAINER_GID \
    CONTAINER_UID \
    CONTAINER_USER \
    POSTGRES_VERSION

WORKDIR /opt/app
 
RUN apt-get update \
    && apt-get install -y \
        build-essential \
        lsb-release \
        wget \
    && echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
    && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
    && apt-get update \
    && apt-get install -y \
        libpq-dev \
        postgresql-${POSTGRES_VERSION} \
    && rm -rf /var/lib/apt/lists/* \
    && addgroup --gid ${CONTAINER_GID} ${CONTAINER_USER} \
    && adduser --shell /bin/bash --uid ${CONTAINER_UID} --gid ${CONTAINER_GID} ${CONTAINER_USER} \
    && chown -R ${CONTAINER_USER}:${CONTAINER_USER} /opt/app \
    && gem update --system

ADD --chown=${CONTAINER_USER}:${CONTAINER_USER} ./Gemfile* /opt/app/ 

USER ${CONTAINER_USER}

SHELL ["/bin/bash", "-c"]

VOLUME ["/bundle"]

RUN bundle config local --path /bundle \
    && bundle install

CMD ["./bin/dev"]
