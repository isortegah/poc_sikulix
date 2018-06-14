FROM isortegah/sikulix_ubuntu_chrome:latest
LABEL authors="isortegah <isortegah@gmail.com>"

USER root

ARG MAVEN_VERSION=3.5.3
ARG USER_HOME_DIR="/home/sikuser"
ARG SHA=b52956373fab1dd4277926507ab189fb797b3bc51a2a267a193c931fffad8408
ARG BASE_URL=https://apache.osuosl.org/maven/maven-3/${MAVEN_VERSION}/binaries

RUN mkdir -p /usr/share/maven /usr/share/maven/ref \
  && curl -fsSL -o /tmp/apache-maven.tar.gz ${BASE_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
  && echo "${SHA}  /tmp/apache-maven.tar.gz" | sha256sum -c - \
  && tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven --strip-components=1 \
  && rm -f /tmp/apache-maven.tar.gz \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"

COPY entry_point.sh /opt/bin/
RUN chown sikuser:sikuser /opt/bin/entry_point.sh \
    && chmod 500 /opt/bin/entry_point.sh

USER sikuser

RUN mkdir /home/sikuser/poc
COPY src /home/sikuser/poc/src
COPY pom.xml /home/sikuser/poc/
RUN cd /home/sikuser/poc && ls -la && mvn install -DskipTests=true