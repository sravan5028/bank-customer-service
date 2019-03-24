FROM frolvlad/alpine-oraclejdk8:slim
VOLUME /tmp
ADD target/bank-customer-service-0.0.1.jarbank-customer-service.jar
RUN sh -c 'touch /bank-customer-service.jar'
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/bank-customer-service.jar"]
EXPOSE 3333
