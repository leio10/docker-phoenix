FROM elixir:1.12.3
LABEL maintainer="Nicolas Bettenburg <nicbet@gmail.com>"

RUN apt-get update && apt-get upgrade -y \
  && mix local.hex --force \
  && mix archive.install --force hex phx_new 1.6.2 \
  && curl -sL https://deb.nodesource.com/setup_16.x | bash \
  && apt-get install -y apt-utils \
  && apt-get install -y nodejs \
  && apt-get install -y build-essential \
  && apt-get install -y inotify-tools \
  && mix local.rebar --force

ENV APP_HOME /app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

EXPOSE 4000

CMD ["mix", "phx.server"]
