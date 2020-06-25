FROM centos

ENV https_proxy "http://10.40.5.121:8080"
ENV http_proxy "http://10.40.5.121:8080"

RUN yum clean all -y
RUN yum install -y epel-release
RUN yum install -y nodejs npm

CMD [ "npm", "start" ]

RUN mkdir app

WORKDIR app

ENV NODE_ENV=production

COPY src/package*.json ./

RUN npm ci

COPY src .

ENTRYPOINT ["node","app.js"]

