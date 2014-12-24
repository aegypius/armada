FROM dockerfile/nodejs

ENV DEBUG armada*
ENV DATABASE_PATH /data

WORKDIR /app
ADD package.json /app/package.json
RUN npm install

ADD . /app

EXPOSE 3333

CMD ["run"]
ENTRYPOINT ["/app/bin/armada"]
