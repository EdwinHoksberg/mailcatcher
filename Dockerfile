FROM ruby:2.4-alpine
MAINTAINER Edwin Hoksberg <mail@edwinhoksberg.nl>

RUN apk add --no-cache gcc g++ make sqlite-dev nodejs

COPY . /app
RUN cd /app && bundle install && bundle exec rake package && gem install --local /app/*.gem

EXPOSE 1025 1080

ENTRYPOINT ["mailcatcher", "-f"]
CMD ["--ip", "0.0.0.0"]
