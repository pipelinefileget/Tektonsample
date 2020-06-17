FROM image-registry.openshift-image-registry.svc:5000/dev09/base-im:latest

CMD [ "npm", "start" ]

RUN mkdir app

WORKDIR app

ENV NODE_ENV=production

COPY src/package*.json ./

RUN npm ci

COPY src .

ENTRYPOINT ["node","app.js"]
