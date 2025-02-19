FROM node:21-alpine3.17 as node-helper

WORKDIR /app
ENV NODE_OPTIONS=--max_old_space_size=2048
RUN npm cache clean --force

COPY moondrop/moondrop-ui .

RUN npm install

ARG BUILD_ENVIRONMENT
RUN npm run build -- --configuration $BUILD_ENVIRONMENT


FROM nginx:1.24

RUN rm /etc/nginx/conf.d/default.conf

ARG NGINX_CONFIG
COPY $NGINX_CONFIG /etc/nginx/templates/
COPY /website /website
COPY --from=node-helper /app/www /usr/share/nginx/periodic