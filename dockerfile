
FROM node:8.9-alpine

ENV NODE_ENV development
# RabbitMQ configuration.
ENV RABBITMQ_HOST 127.0.0.1
ENV RABBITMQ_PORT 5672
ENV RABBITMQ_USER guest
ENV RABBITMQ_PASSWORD guest
ENV RABBITMQ_VHOST /

WORKDIR /usr/app
COPY package.json .
COPY package-lock.json .
COPY tsconfig.json .

RUN npm install

COPY src .

RUN npm run build

EXPOSE 8080

CMD ["npm", "run", "start-server"]T