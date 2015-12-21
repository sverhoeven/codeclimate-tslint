FROM mhart/alpine-node

WORKDIR /usr/src/app
COPY package.json /usr/src/app/
COPY tslint.json /usr/src/app/

RUN apk --update add git

RUN npm install

RUN adduser -u 9000 -D app
USER app

COPY . /usr/src/app

CMD ["node", "/usr/src/app/bin/index.js"]
