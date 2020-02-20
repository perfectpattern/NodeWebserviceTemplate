FROM alpine:3.11


# Add user so we don't need --no-sandbox.
RUN addgroup -S pptruser && adduser -S -g pptruser pptruser \
    && mkdir /app \
    && chown -R pptruser:pptruser /home/pptruser \
    && chown -R pptruser:pptruser /app \
    && apk add --no-cache npm

# Run everything after as non-privileged user.
USER pptruser

WORKDIR /app
COPY --chown=pptruser:pptruser ["package.json","./"]
COPY --chown=pptruser:pptruser ["src","./src"]

RUN npm install
EXPOSE 8080
ENTRYPOINT npm start
