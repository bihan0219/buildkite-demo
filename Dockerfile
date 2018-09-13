FROM openjdk:8-jdk-alpine
MAINTAINER "Gao Shuai" <gaoshuai1205@gmail.com>

ENV APP_DIR  /app/

RUN mkdir -p $APP_DIR

WORKDIR $APP_DIR
COPY . $APP_DIR

RUN $APP_DIR/gradlew build

COPY startup.sh $APP_DIR
RUN chmod u+x ./startup.sh
HEALTHCHECK CMD wget -qO-  http://localhost:8080/api/health || exit 1
EXPOSE 8080
CMD ["./startup.sh"]