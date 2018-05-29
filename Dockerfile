FROM arm32v7/debian

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update \
 && apt-get install -y -q --no-install-recommends \
    build-essential \
    ruby-dev \
    rubygems \
    vim \
    git \
 && apt-get clean \
 && rm -r /var/lib/apt/lists/*

# jdk downloaded from http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html in advance.
COPY jdk-8u172-linux-arm32-vfp-hflt.tar.gz /
RUN tar zxvf jdk-8u172-linux-arm32-vfp-hflt.tar.gz -C /opt \
 && rm jdk-8u172-linux-arm32-vfp-hflt.tar.gz
ENV JAVA_HOME /opt/jdk1.8.0_172/jre
ENV PATH=$PATH:$JAVA_HOME/bin

RUN gem install --no-document jekyll bundler s3_website

ENV JEKYLLPATH /var/jekyll

VOLUME $JEKYLLPATH

EXPOSE 80

WORKDIR $JEKYLLPATH

CMD ["tail", "-f", "/dev/null"]

