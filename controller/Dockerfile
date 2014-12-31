FROM dockerfile/nodejs

ENV DEBUG armada*
ENV DATABASE_PATH /data

EXPOSE 3333

WORKDIR /app
ADD package.json /app/package.json
RUN npm install
ADD . /app

CMD ["run"]
ENTRYPOINT ["/app/bin/armada"]
