FROM bigboards/base-__arch__:14.04

MAINTAINER bigboards (hello@bigboards.io)

# Install Java.
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections \
    && apt-get update \
    && apt-get install -y software-properties-common \
    && add-apt-repository -y ppa:webupd8team/java \
    && apt-get update \
    && apt-get install -y oracle-java8-installer \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/oracle-jdk8-installer \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/apt/archives/*.deb /var/cache/apt/archives/partials/*

# Define working directory.
WORKDIR /data

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Define default command.
CMD ["bash"]
