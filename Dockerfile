FROM ubuntu:14.04
MAINTAINER ranpop

# update source
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe"> /etc/apt/sources.list
RUN apt-get update

# Install curl
RUN apt-get -y install curl

# # Install JDK 7
# RUN cd /tmp &&  curl -L 'http://download.oracle.com/otn-pub/java/jdk/8u111-b14/jdk-8u111-linux-x64.tar.gz' -H 'Cookie: oraclelicense=accept-securebackup-cookie; gpw_e24=Dockerfile' | tar -xz
# RUN mkdir -p /usr/lib/jvm
# RUN mv /tmp/jdk1.8.0_111/ /usr/lib/jvm/java-8-oracle/

# # Set Oracle JDK 7 as default Java
# RUN update-alternatives --install /usr/bin/java java /usr/lib/jvm/java-8-oracle/bin/java 300
# RUN update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/java-8-oracle/bin/javac 300

# ENV JAVA_HOME /usr/lib/jvm/java-8-oracle/

# # Install tomcat8
# RUN cd /tmp && curl -L 'http://archive.apache.org/dist/tomcat/tomcat-8/v8.0.39/bin/apache-tomcat-8.0.39.tar.gz' | tar -xz
# RUN mv /tmp/apache-tomcat-8.0.39/ /opt/tomcat8/

# WORKDIR /mex-ssp-ui-new

# ADD ./ssp-ui.war /opt/tomcat8/webapps/

# ENV API_HOST http://api.sspprod.ad-mex.com
# ENV CATALINA_HOME /opt/tomcat8
# ENV PATH $PATH:$CATALINA_HOME/bin

# ADD tomcat8.sh /etc/init.d/tomcat8
# RUN chmod 755 /etc/init.d/tomcat8

# # Expose ports.
# EXPOSE 8080

# # Define default command.
# ENTRYPOINT service tomcat8 start && tail -f /opt/tomcat8/logs/catalina.out

