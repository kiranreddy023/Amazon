FROM alpine:3.15
LABEL author = Kiran Vepanjeri
RUN apk add default-jre
WORKDIR /opt/
RUN curl https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.76/bin/apache-tomcat-9.0.76.tar.gz .
RUN tar -xf apache-tomcat-9.0.76.tar.gz
RUN mv apache-tomcat-9.0.76 tomcat
COPY Amazon-Web/target/Amazon.war ./tomcat/webapps/
EXPOSE 8080
CMD ["./tomcat/bin/catalina.sh","run"]


