FROM ruby:3.0.0-alpine3.13

RUN apk update && \
      apk add --no-cache \
      tzdata \
      libxml2-dev \
      curl-dev \
      make \
      gcc \
      libc-dev \
      g++ \
      libxslt-dev \
      build-base \
      mariadb-dev

WORKDIR /app
COPY . /app/.
RUN cp /app/.env.production /app/.env & source .env
RUN bundle install

# Add a script to be executed every time the container starts.
# COPY entrypoint.sh /usr/bin/
# RUN chmod +x /usr/bin/entrypoint.sh
# ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# -b はIPをバインドするためのオプション
# ポートフォワーディング
CMD ["rails", "server", "-b", "0.0.0.0"]

# docker buildするためのメモ書き
# sudo docker build ./ -t rails
# sudo docker run -d -p 3000:3000 rails
