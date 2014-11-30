FROM aegypius/nodejs

ADD . /app
WORKDIR /app
RUN cd /app
RUN npm install

EXPOSE 3333

ENV DEBUG armada*

CMD ["npm", "start"]
