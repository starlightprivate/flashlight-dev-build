FROM node:7.5.0

# This all will be cached for all future builds in local docker registry
ENV NODE_ENV=staging
RUN npm install -g babel-cli@^6.18.0 gulp@^3.9.1
RUN mkdir -p /src/app-server/public
EXPOSE 8000
# end of states cached for future builds


# Build `node-api` using babel-cli
# Since backend is not changing so fast as frontend code, it build state will be cached at local docker registry
ADD ./node-api  /src/node-api
WORKDIR /src/node-api
RUN npm install

# Build frontend code 
ADD ./flashlightsforever  /src/flashlightsforever
WORKDIR /src/flashlightsforever
RUN npm install
RUN gulp build
# Copy compiled frontend code
RUN cp -r /src/flashlightsforever/tacticalsales/* /src/app-server/public
# End building frontend code

WORKDIR /src/node-api
CMD ["npm","start"]