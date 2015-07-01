FROM iojs:2

RUN npm install -g superstatic

ENV PORT 8080
ENV LOG_REQUESTS true
ENV USE_GZIP true

VOLUME /data
WORKDIR /data
ADD index.html /data/index.html
ONBUILD ADD . /data

EXPOSE $PORT
ENTRYPOINT superstatic --host 0.0.0.0 --port $PORT --gzip $USE_GZIP --debug LOG_REQUESTS
