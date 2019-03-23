FROM node:alpine as Builder
WORKDIR /apps
COPY package.json .
RUN npm install
COPY . .
CMD npm run build

FROM nginx 
COPY --from=Builder /apps/build /usr/share/nginx/html