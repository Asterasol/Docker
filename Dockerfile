#FROM adoptopenjdk/openjdk16:ubi
#FROM ubuntu:latest
FROM openjdk:16-alpine3.13


#####  Install git

#RUN apt update
#RUN apt install -y git

#ARG JAR_FILE=Test-0.0.1-SNAPSHOT.jar
#COPY ${JAR_FILE} app.jar

RUN apk update
RUN apk add git

#RUN apt-get -y update
#RUN apt-get -y install git

RUN mkdir /home/metrik-JVM
RUN cd /home/metrik-JVM
RUN git clone https://github.com/Asterasol/Docker.git


WORKDIR /home/metrik-JVM

## COPY /jolokia-jvm.jar /



# COPY /jolokia-jvm.jar /
EXPOSE 8778 8080
#ENTRYPOINT ["java","-javaagent:/Docker/jolokia-jvm.jar=port=8778,host=0.0.0.0","-jar","/app.jar"]
CMD ["java","-javaagent:/Docker/jolokia-jvm.jar=port=8778,host=0.0.0.0","-jar","/Docker/Test-0.0.1-SNAPSHOT.jar"]
