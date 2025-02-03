FROM nginx:1.27-bookworm

WORKDIR /home/app

RUN mkdir logs

COPY ./dist .

COPY ./config/conf.d/nginx.conf /etc/nginx/conf.d/default.conf

COPY ./config/ssl/ /etc/nginx

EXPOSE 80
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]