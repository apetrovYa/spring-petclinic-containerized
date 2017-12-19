FROM openjdk:8u151-jdk
LABEL maintainer="Andre Petrov <andrei.petrov@iks.it>"
ENV REPOSITORY="https://github.com/spring-projects/spring-petclinic.git"
RUN apt-get install git
WORKDIR /opt
RUN wget http://www-eu.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz && \
    tar -xvzf apache-maven-3.3.9-bin.tar.gz && \
    mv apache-maven-3.3.9 maven
ENV M2_HOME=/opt/maven
ENV PATH=${M2_HOME}/bin:${PATH}
RUN git clone ${REPOSITORY}
WORKDIR /opt/spring-petclinic 
EXPOSE 8080
CMD ["./mvnw","spring-boot:run"]