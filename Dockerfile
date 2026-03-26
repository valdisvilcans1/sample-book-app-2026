FROM node:25-slim
LABEL AUTHOR="Martins T."

WORKDIR /sample-book-app
COPY index.js index.js
COPY package.json package.json

RUN npm install

EXPOSE 1050

CMD [ "index.js" ]
ENTRYPOINT [ "node" ]