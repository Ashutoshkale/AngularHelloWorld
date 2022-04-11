FROM node:16.13.1-bullseye-slim as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY ./ .
RUN npm run build

FROM nginx:1.21.5-alpine as artifact-stage

COPY --from=build-stage /app/dist/ /usr/share/nginx/html


COPY nginx/nginx.conf /etc/nginx/conf/
COPY nginx/default.conf.template /etc/nginx/templates/
COPY nginx/nginx-entry.sh /
RUN chmod 0700 /usr/share/nginx/html && \
    chmod 0644 -R /usr/share/nginx/html/* && \
    chown nginx:nginx -R /usr/share/nginx/html && \
    chmod 0700 /nginx-entry.sh && \
    find /usr/share/nginx/html -type d -exec chmod 0755 {} \;

ENTRYPOINT ["/nginx-entry.sh"] 
