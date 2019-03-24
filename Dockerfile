FROM frolvlad/alpine-glibc:alpine-3.8
VOLUME /tmp
ADD target/customer-service-0.0.1-SNAPSHOT.jar bank-customer-service.jar
RUN sh -c 'touch /bank-customer-service.jar'
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/bank-customer-service.jar"]
EXPOSE 3333
