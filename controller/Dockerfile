FROM dockerfile/nodejs

ADD package.json /data/package.json
RUN npm install

ADD . /data

EXPOSE 3333

ENV DEBUG armada*

CMD ["npm", "start"]
