FROM node:10 AS build
COPY . /miew
RUN cd /miew \
    && yarn \
    && yarn run ci

FROM nginx:1.19.5-alpine
LABEL maintainer="miew@epam.com"
COPY --from=build /miew/build /usr/share/nginx/html
