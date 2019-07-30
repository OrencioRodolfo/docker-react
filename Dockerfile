###############
# BUILD PHASE #
###############

FROM node:alpine as builder

WORKDIR /usr/app
COPY package.json .

RUN npm install

COPY . .
RUN npm run build

#############
# RUN PHASE #
#############
FROM nginx

COPY --from=builder /usr/app/build usr/share/nginx/html

# nginxs starts automatically once the container is started

