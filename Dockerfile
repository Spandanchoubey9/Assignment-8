
FROM nginx:alpine

ARG VERSION

COPY ${VERSION}/index.html /usr/share/nginx/html/index.html

EXPOSE 80
