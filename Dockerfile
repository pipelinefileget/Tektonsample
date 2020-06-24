FROM registry.access.redhat.com/ubi8/nodejs-12

CMD [ "npm", "start" ]

ENV https_proxy "http://10.40.5.121:8080"
ENV http_proxy "http://10.40.5.121:8080"

RUN mkdir app

WORKDIR app

ENV NODE_ENV=production

COPY src/package*.json ./

RUN npm ci

COPY src .

ENTRYPOINT ["node","app.js"]
