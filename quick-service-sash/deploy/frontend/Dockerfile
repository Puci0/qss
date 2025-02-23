FROM harbor.cs.pib.nask.pl/qss_project/base-frontend:latest AS build

COPY ./services/frontend/QSS/ /usr/src/app/

RUN ng build --configuration=production --output-path=/usr/src/app/dist


FROM nginx:alpine

RUN mkdir -p /usr/share/nginx/html

COPY --from=build /usr/src/app/dist /usr/share/nginx/html
COPY ./deploy/frontend/default.conf /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g", "daemon off;"]
