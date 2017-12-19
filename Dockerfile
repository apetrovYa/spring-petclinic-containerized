FROM openjdk:8u151-jdk
LABEL maintainer="Andrei Petrov <apetrov.ya@yandex.ru>"
EXPOSE 8080
WORKDIR /opt
ENV M2_HOME=/opt/maven
ENV PATH=${M2_HOME}/bin:${PATH}

RUN apt-get install git && \
    wget http://www-eu.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz && \
    tar -xvzf apache-maven-3.3.9-bin.tar.gz && \
    mv apache-maven-3.3.9 maven

ENV REPOSITORY="https://github.com/apetrovYa/spring-petclinic-containerized.git"
USER root:root
RUN git clone ${REPOSITORY} && chown -R root /opt/spring-petclinic-containerized
WORKDIR /opt/spring-petclinic-containerized

CMD ["./mvnw","spring-boot:run"]