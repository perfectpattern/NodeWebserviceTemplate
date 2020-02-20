FROM node:alpine

RUN mkdir /app \
   && chown -R node:node /app

# Run everything after as non-privileged user.
USER node

WORKDIR /app
COPY --chown=node:node ["package.json","./"]
COPY --chown=node:node ["src","./src"]

RUN npm install
EXPOSE 8080
ENTRYPOINT npm start
