FROM elixir:latest
RUN apt-get update && apt-get install --yes postgresql-client
ADD . /app
RUN mix local.hex --force
WORKDIR /app
EXPOSE 4000
CMD ["mix", "phoenix.server"]
#CMD ["/bin/bash"]
