# This  is multi step build  (build phase +  run phase)

FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# first step creates /app/build

# ------------------------------------------------------------------

FROM nginx

# second step need to copy it from builder

COPY --from=builder /app/build /usr/share/nginx/html

# default command of nginx image starts nginx so we don't need to use RUN here



