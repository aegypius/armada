FROM dockerfile/nodejs

ADD package.json /data/package.json
RUN npm install

ADD . /data

EXPOSE 80

CMD ["npm", "start"]
